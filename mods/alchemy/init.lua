local reagents = {}
reagents["default:mese_crystal_fragment"] = "alchemy:magic"
reagents["flowers:chrysanthemum_green"] = "alchemy:mobility"
reagents["flowers:dandelion_white"] = "alchemy:holy"
reagents["flowers:dandelion_yellow"] = "alchemy:shine"
reagents["flowers:geranium"] = "alchemy:mana"
-- reagents["flowers:mushroom_brown"] = "alchemy:"
reagents["flowers:mushroom_red"] = "alchemy:poison"
reagents["flowers:rose"] = "alchemy:healing"
-- reagents["flowers:tulip"] = "alchemy:"
-- reagents["flowers:tulip_black"] = "alchemy:protection"
-- reagents["flowers:viola"] = "alchemy:strength"
reagents["flowers:waterlily"] = "alchemy:gills"
reagents["mobs:pork_raw"] = "alchemy:vitality"
reagents["mobs:honey"] = "alchemy:stamina"
-- reagents["mobs:lava_orb"] = "alchemy:antifire"


-- Potions
minetest.register_craftitem("alchemy:bottled_water", {
    description = "Bottled Water",
    inventory_image = "alchemy_bottled_water.png",
    -- on_use = minetest.item_eat(1)
    on_use = function(itemstack, user, pointed_thing)
        -- minetest.chat_send_all(dump(itemstack))
        -- minetest.chat_send_all(dump(user))
        -- minetest.chat_send_all(dump(pointed_thing))
        -- minetest.chat_send_all("------------------------------------")
        -- effects_hud.add_effect(user:get_player_name(), "water_breathing", 30)
        -- itemstack:take_item()
        -- return itemstack
    end
})

minetest.register_craft({
    type = "shapeless",
	output = "alchemy:bottled_water 3",
	recipe = {"bucket:bucket_water", "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
    replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
})

minetest.register_craftitem("alchemy:gills", {
    description = "Gills Potion\nAllows breathing underwater for 30 seconds.",
    inventory_image = "alchemy_potion_gills.png";
    on_use = function(itemstack, user, pointed_thing)
        effects_hud.add_effect(user:get_player_name(), "water_breathing", 30)
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:healing", {
    description = "Healing Potion\nFaster health regeneration for 10 seconds.",
    inventory_image = "alchemy_potion_healing.png";
    on_use = function(itemstack, user, pointed_thing)
        effects_hud.add_effect(user:get_player_name(), "health_regeneration", 10)
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:holy", {
    description = "Holy Water\nNullify all effects on the player and\nkeeps him 'clean' for 30 second.",
    inventory_image = "alchemy_potion_holy.png";
    on_use = function(itemstack, user, pointed_thing)
        effects_hud.add_effect(user:get_player_name(), "purity", 30)
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:magic", {
    description = "Magic potion\nIncrease max mana.",
    inventory_image = "alchemy_potion_magic.png";
    on_use = function(itemstack, user, pointed_thing)
        local name = user:get_player_name()
        local current = hbmana.getmax(name)
        if current < hbmana.settings.max_reachable then
            hbmana.setmax(name, current + 5)
            itemstack:take_item()
            return itemstack
        end
    end
})

minetest.register_craftitem("alchemy:mana", {
    description = "Mana Potion\nFaster mana regeneration for 10 seconds.",
    inventory_image = "alchemy_potion_mana.png";
    on_use = function(itemstack, user, pointed_thing)
        effects_hud.add_effect(user:get_player_name(), "mana_regeneration", 10)
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:mobility", {
    description = "Mobility Potion\nIncreases walking speed and jumping height for 60 seconds.",
    inventory_image = "alchemy_potion_mobility.png";
    on_use = function(itemstack, user, pointed_thing)
        effects_hud.add_effect(user:get_player_name(), "mobility", 60)
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:shine", {
    description = "Shine Potion\nMakes you shine for 60 seconds.",
    inventory_image = "alchemy_potion_shine.png";
    on_use = function(itemstack, user, pointed_thing)
        effects_hud.add_effect(user:get_player_name(), "shine", 60)
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:poison", {
    description = "Flask of Poison (Throwable)\nHurts the affected for 10 seconds.",
    inventory_image = "alchemy_potion_poison.png";
    on_use = function(itemstack, user, pointed_thing)
        effects_hud.add_effect(user:get_player_name(), "poison", 10)
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:stamina", {
    description = "Stamina Potion\nIncrease max satiation.",
    inventory_image = "alchemy_potion_stamina.png";
    on_use = function(itemstack, user, pointed_thing)
        local name = user:get_player_name()
        if hbhunger.players[name].satiation ~= hbhunger.max_reachable_satiation then
            hbhunger.players[name].satiation = hbhunger.players[name].satiation + 5
        end
        itemstack:take_item()
        return itemstack
    end
})

minetest.register_craftitem("alchemy:vitality", {
    description = "Vitality Potion\nIncrease max health.",
    inventory_image = "alchemy_potion_vitality.png";
    on_use = function(itemstack, user, pointed_thing)
        local current_max_hp = user:get_properties().hp_max

        if current_max_hp < (tonumber(minetest.settings:get("health_adjuster_max_reachable")) or 50) then
            health_adjuster.set_players_max_health(user, current_max_hp + 5)

            itemstack:take_item()
            return itemstack
        end
    end
})


minetest.register_node("alchemy:alchemy_set", {
    description = "Alchemy Set",
    drawtype = "mesh",
    mesh = "alchemy_alchemy_set.obj",
    tiles = { "alchemy_alchemy_set.png" },
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.2, -0.5, -0.1, 0.5, 0.2, 0.3},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.2, -0.5, -0.1, 0.5, 0.2, 0.3},
        },
    },
    paramtype2 = "facedir",
    groups = {dig_immediate = 3},

    on_construct = function(pos)
        local has_something_in_output = false
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
        "size[8,9]"..
        "image[1,2;1,1;alchemy_drop.png]"..
        "image[2,2;1,1;gui_arrow.png]"..
        "list[context;component;1,1;1,1;]"..
        "list[context;bottle;1,3;1,1;]"..
        "list[context;output;3,2;1,1;]"..
        "list[current_player;main;0,5;8,4;]"..
        "listring[current_player;main]"..
        "listring[context;component]"..
        "listring[current_player;main]"..
        "listring[context;bottle]"..
        "listring[current_player;main]"..
        "listring[context;output]"..
        "listring[current_player;main]")
        local inv = meta:get_inventory()
        inv:set_size("component", 1*1)
        inv:set_size("bottle", 1*1)
        inv:set_size("output", 1*1)
    end,

    allow_metadata_inventory_put = function(pos, listname, index, stack)
        if listname == "component" then
            local inv = minetest.get_meta(pos):get_inventory()
            if inv:is_empty("output") then
                local item = stack:get_name()
                for k,v in pairs(reagents) do
                    if item == k then
                        return stack:get_count()
                    end
                end
            end
        elseif listname == "bottle" then
            if stack:get_name() == "alchemy:bottled_water" then
                return stack:get_count()
            end
        elseif listname == "output" then
            return 0
        end

        return 0
    end,

    allow_metadata_inventory_move = 0,

    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        if minetest.is_protected(pos, player:get_player_name()) then
            return 0
        end
        return stack:get_count()
    end,

    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        minetest.log("action", player:get_player_name() ..
        " moves stuff in alchemic station at " .. minetest.pos_to_string(pos))
    end,

    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name() ..
        " puts stuff to alchemic station at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()

        if not inv:is_empty("bottle") then
            if not inv:is_empty("component") then
                if inv:is_empty("output") then
                    local reagent = inv:get_stack("component", 1):get_name()
                    inv:add_item("output", reagents[reagent])

                    -- AZONNAL ADJA ODA, NE KELLJEN FŐZÉSRE VÁRNI
                    -- stack_to_pack = string.gsub(stack_to_pack, "farming:", "farming:bag_of_")
                    -- has_something_in_output = true
                end
            end
        end
    end,

    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name() ..
        " takes stuff from alchemy station at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()
        local item_in_output = inv:get_stack("output", 1):get_name()

        if not inv:is_empty("bottle") then
            if not inv:is_empty("component") then
                if inv:is_empty("output") then
                    local item_to_remove = inv:get_stack("component", 1):get_name()
                    inv:remove_item("component", item_to_remove)
                    inv:remove_item("bottle", "alchemy:bottled_water")
                end
            else
                inv:remove_item("output", item_in_output)
            end
        else
            inv:remove_item("output", item_in_output)
        end
    end,

    on_destruct = function(pos)
        local drop = ""
        local temp = {}

        default.get_inventory_drops(pos, "component", temp)
        default.get_inventory_drops(pos, "output", temp)
        default.get_inventory_drops(pos, "bottle", temp)

        for i,v in ipairs(temp) do
            drop = v.name .. " " .. v.count
            minetest.add_item(pos, drop)
        end
    end
})

minetest.register_craft({
    output = "alchemy:alchemy_set",
    recipe = {
        {"default:glass", "default:glass"},
        {"group:stone", "vessels:glass_bottle"},
    }
})
