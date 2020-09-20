local obelisks = {}
local obelisk_counter = 1
local formspec_obelisks_table = {}
local currently_used_obelisks = {}

local mod_storage = minetest.get_mod_storage()

local strings_to_concat = {}

if mod_storage:get_string("obelisks_data") ~= nil and
    mod_storage:get_string("obelisks_data") ~= "return nil" and
    mod_storage:get_string("obelisks_data") ~= "" and
    mod_storage:get_int("obelisk_counter") ~= nil and
    mod_storage:get_int("obelisk_counter") ~= "return nil" and
    mod_storage:get_int("obelisk_counter") ~= "" then

    obelisks = minetest.deserialize(mod_storage:get_string("obelisks_data"))
    obelisk_counter = mod_storage:get_int("obelisk_counter")
end

local function save_obelisks()
    mod_storage:set_string("obelisks_data", minetest.serialize(obelisks))
    mod_storage:set_int("obelisk_counter", obelisk_counter)
end

local function get_formspec(pos)
    local meta = minetest.get_meta(pos)
    local formspec_obelisks_string = ""
    formspec_obelisks_table = {}

    for k,v in pairs(obelisks) do
        strings_to_concat = {}
        table.insert(strings_to_concat, k)
        table.insert(strings_to_concat, ":")

        local nice_string = string.gsub(v, "\"", "")
        nice_string = string.gsub(nice_string, "%[", "")
        nice_string = string.gsub(nice_string, "%]", "")
        nice_string = string.gsub(nice_string, " = ", "=")
        nice_string = string.gsub(nice_string, ",", "")

        table.insert(strings_to_concat, nice_string)

        table.insert(formspec_obelisks_table, table.concat(strings_to_concat, ""))
    end

    formspec_obelisks_string = table.concat(formspec_obelisks_table, ",")

    strings_to_concat = {
        "size[6,6]",
        "field[1,0.3;4.5,0.5;obelisk_name;;", meta:get_string("_name"), "]",
        "tooltip[obelisk_name;This will be the obelisk's name after exit.(Hit enter.);#666666;#FFFFFF]",
        "field_close_on_enter[obelisk_name;false]",

        -- "set_focus[other_obelisks;true]", -- Doesn't work...
        "textlist[0,0.8;5.8,5.2;other_obelisks;",formspec_obelisks_string,"]",
        "tooltip[other_obelisks;Doubleclick on any obelisk to teleport. (50 mana);#666666;#FFFFFF]",
    }

    return table.concat(strings_to_concat, "")
end

minetest.register_node("teleports:obelisk", {
    description = "Obelisk",
    drawtype = "mesh",
    mesh = "teleports_obelisk.obj",
    tiles = {"default_obsidian.png"},
    inventory_image = "teleports_obelisk.png",
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 2.0, 0.4},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 1.5, 0.4}, -- If I made it the same height as the selection_box then it has no top side and you fall into
        },
    },
    groups = {cracky = 3},

    on_construct = function(pos)
        local meta = minetest.get_meta(pos)

        meta:set_int("_id", obelisk_counter)
        meta:set_string("_name", "Teleport Obelisk " .. meta:get_int("_id"))
        obelisk_counter = obelisk_counter + 1

        local obelisk_data = minetest.serialize(pos)
        obelisk_data = string.gsub(obelisk_data, "return ", meta:get_string("_name") .. ":")
        obelisks[meta:get_int("_id")] = obelisk_data

        save_obelisks()
    end,

    on_destruct = function(pos)
        local meta = minetest.get_meta(pos)
        obelisks[meta:get_int("_id")] = nil
        save_obelisks()
    end,

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local name = clicker:get_player_name()
        currently_used_obelisks[name] = pos
        minetest.show_formspec(name, "teleport:menu", get_formspec(pos))
    end
})

minetest.register_craft({
    output = "teleports:obelisk",
    recipe = {
        {"default:obsidian"},
        {"default:obsidian"},
        {"default:obsidian"}
    }
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    local obelisk_pos = currently_used_obelisks[name]

    if formname == "teleport:menu" then
        if fields.obelisk_name then
            local safe_string = string.gsub(fields.obelisk_name, "%c", "")
            local meta = minetest.get_meta(obelisk_pos)

            meta:set_string("_name", safe_string)

            local obelisk_data = minetest.serialize(obelisk_pos)
            obelisk_data = string.gsub(obelisk_data, "return ", safe_string .. ":")

            obelisks[meta:get_int("_id")] = obelisk_data
        end

        if fields.other_obelisks then
            local event = minetest.explode_textlist_event(fields.other_obelisks)
            local players_mana = hbmana.get(name)
            if event.type == "DCL" and players_mana >= 50 then
                local list_id = event.index

                local destination_pos = string.match(formspec_obelisks_table[list_id], "{.*")
                destination_pos = string.gsub(destination_pos, " ", ", ")
                destination_pos = string.gsub(destination_pos, "{", "return {%[\"")
                destination_pos = string.gsub(destination_pos, ", ", ", %[\"")
                destination_pos = string.gsub(destination_pos, "=", "\"%] = ")
                destination_pos = minetest.deserialize(destination_pos)
                destination_pos.x = destination_pos.x - 1

                hbmana.set(name, players_mana - 50)
                player:set_pos(destination_pos)
                minetest.sound_play("teleports_teleport", {pos = obelisk_pos, gain = 2}, true)
                currently_used_obelisks[name] = nil
                minetest.close_formspec(name, "teleport:menu")
            end
        end
    end
end)

minetest.register_tool("teleports:teleport_stone", {
    description = "Teleport Stone\nLeft click teleports you to the stone's obelisk. (Mana: 50)\nRight click on an obelisk sets it as the stone's destination.",
    inventory_image = "teleports_teleport_stone.png",

    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)
        local destination_pos = minetest.deserialize(itemstack:get_meta():get_string("_obelisk_pos"))

        if destination_pos ~= nil and destination_pos.x ~= nil and players_mana >= 50 then
            hbmana.set(name, players_mana - 50)
            destination_pos.x = destination_pos.x - 1
            minetest.sound_play("teleports_teleport", {pos = player:get_pos(), gain = 2}, true)
            player:set_pos(destination_pos)
        end
    end,

    on_place = function(itemstack, placer, pointed_thing) -- Right click
        if minetest.get_node(pointed_thing.under).name == "teleports:obelisk" then
            itemstack:get_meta():set_string("_obelisk_pos", minetest.serialize(pointed_thing.under))
            return itemstack
        end
    end
})

minetest.register_craft({
	output = "teleports:teleport_stone",
	recipe = {
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
		{"default:obsidian_shard", "default:mese_crystal", "default:obsidian_shard"},
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
	}
})
