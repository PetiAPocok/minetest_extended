local function get_control_center_formspec()
    local owner = mex_chariot_ms:get_string("owner")

    local pos = minetest.deserialize(mex_chariot_ms:get_string("chariot_pos"))
    local position = string.gsub(minetest.pos_to_string(pos, 0), ",", ", ")

    local biome_name = ""
    local biome_raw = minetest.get_biome_name(minetest.get_biome_data(pos).biome)
    biome_raw = biome_raw:gsub("_", " ")

    for word in biome_raw:gmatch("%w+") do
        biome_name = biome_name .. word:gsub("^%l", string.upper) .. " "
    end

    local destination_pos = minetest.deserialize(mex_chariot_ms:get_string("destination_pos"))
    local destination_position = ""
    local new_dest_X = ""
    local new_dest_Y = ""
    local new_dest_Z = ""

    local destination_biome_raw = ""
    local destination_biome_name = ""

    if destination_pos then
        destination_position = string.gsub(minetest.pos_to_string(destination_pos, 0), ",", ", ")

        new_dest_X = destination_pos.x
        new_dest_Y = destination_pos.y
        new_dest_Z = destination_pos.z

        destination_biome_raw =  minetest.get_biome_name(minetest.get_biome_data(destination_pos).biome)
        destination_biome_raw = destination_biome_raw:gsub("_", " ")
    end

    for word in destination_biome_raw:gmatch("%w+") do
        destination_biome_name = destination_biome_name .. word:gsub("^%l", string.upper) .. " "
    end

    local lights = mex_chariot_ms:get_string("lights")
    if lights == "" then
        mex_chariot_ms:set_string("lights", "on")
        lights = "on"
    end

    local lock = mex_chariot_ms:get_string("lock")
    if lock == "" then
        mex_chariot_ms:set_string("lock", "Unlocked")
        lock = "Unlocked"
    end

    -- <X>,<Y>;<W>,<H>
    return "size[10,6.4]"..
        "label[3.8,0;Chariot Control]"..

        "label[0,0.6;Current position:\n" .. position .. "]"..
        "label[0,1.6;Biome:\n" .. biome_name .. "]"..
        "field[0.3,2.8;3,1;octainer_name;;Octainer's name]"..
        "button[0,3.4;3,1;engrave;Engrave to octainer]"..
        "button[0,4.5;3,1;lights;Lights " .. lights .. "]"..
        "label[0,5.6;Owner:\n" .. owner .. "]"..

        "button[3.4,0.6;3,1;rand_dest_set;Random coordinates]"..
        "label[3.1,1.7;New destination coordinates:]"..
        "field[3.5,2.8;1.2,1;new_dest_X;X:;" .. new_dest_X .. "]"..
        "field[4.6,2.8;1.2,1;new_dest_Y;Y:;" .. new_dest_Y .. "]"..
        "field[5.7,2.8;1.2,1;new_dest_Z;Z:;" .. new_dest_Z .. "]"..
        "button[3.9,3.4;2,1;new_dest_set;Set]"..
        "button[3.4,4.5;3,1;get_from_octainer;Get from octainer]"..
        "button[3.4,5.6;3,1;lock;" .. lock .. "]"..

        "label[7,0.6;Destination coordinates:\n" .. destination_position .. "]"..
        "label[7,1.6;Destination biome:\n" .. destination_biome_name .. "]"..
        "button[7.3,2.5;2,1;travel;Travel]"..
        "button[7,5.6;3,1;abandon;Abandon]"..
        ""
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "chariot_navigation" then
        if fields then
            local player_name = player:get_player_name()
            local chariot_pos = minetest.deserialize(mex_chariot_ms:get_string("chariot_pos"))
            local octadrive_pos = minetest.find_node_near(chariot_pos, 10, "mex_chariot:octadrive")
            local octadrive_inv = minetest.get_inventory({type="node", pos=octadrive_pos})

            if fields.quit == "true" then
                mex_chariot_ms:set_string("driver", "")
            elseif fields.travel then
                local generator_pos = minetest.find_node_near(chariot_pos, 10, "mex_chariot:generator")
                local generator_inv = minetest.get_inventory({type="node", pos=generator_pos})

                if generator_inv:get_stack("input", 1):get_name() == "nether_ores:vidore_lump" and
                   generator_inv:get_stack("input", 2):get_name() == "nether_ores:vidore_lump" and
                   generator_inv:get_stack("input", 3):get_name() == "nether_ores:vidore_lump" and
                   generator_inv:get_stack("input", 4):get_name() == "nether_ores:vidore_lump" then
                    if mex_chariot_ms:get_string("destination_pos") ~= "" then
                        if octadrive_inv:contains_item("slot", "mex_chariot:octainer") then
                            local octainer_stack = octadrive_inv:get_stack("slot", 1)

                            if player:get_inventory():room_for_item("main", octainer_stack) then
                                player:get_inventory():add_item("main", octainer_stack)
                            else
                                minetest.add_item(player:get_pos(), octainer_stack)
                            end

                            octadrive_inv:remove_item("slot", octainer_stack)

                            minetest.show_formspec(player_name, "chariot_navigation", get_control_center_formspec())
                        end

                        generator_inv:remove_item("input", "nether_ores:vidore_lump 4")

                        minetest.close_formspec(player_name, "chariot_navigation")
                        minetest.add_particlespawner({
                            amount = 5000,
                            time = 5,
                            minpos = {
                                x = chariot_pos.x - 1,
                                y = chariot_pos.y - 2,
                                z = chariot_pos.z - 1
                            },
                            maxpos = {
                                x = chariot_pos.x + 10,
                                y = chariot_pos.y + 5,
                                z = chariot_pos.z + 10
                            },
                            minvel = {x=0, y=3, z=0},
                            maxvel = {x=0, y=5, z=0},
                            minacc = {x=0, y=0, z=0},
                            maxacc = {x=0, y=0, z=0},
                            minexptime = 1,
                            maxexptime = 2,
                            minsize = 1,
                            maxsize = 5,
                            texture = "orb_of_shadow_particle.png",
                            glow = 3
                        })
                        minetest.after(3, function()
                            local new_pos = minetest.deserialize(mex_chariot_ms:get_string("destination_pos"))
                            local dist_to_move = {
                                x = new_pos.x - chariot_pos.x,
                                y = new_pos.y - chariot_pos.y,
                                z = new_pos.z - chariot_pos.z
                            }
                            local pos1 = table.copy(chariot_pos)
                            local pos2 = {}
                            pos2.x = pos1.x + 10
                            pos2.y = pos1.y + 9
                            pos2.z = pos1.z + 10
                            for key, value in pairs(dist_to_move) do
                                worldedit.move(pos1, pos2, key, value)
                                pos1[key] = pos1[key] + value
                                pos2[key] = pos2[key] + value
                            end

                            mex_chariot_ms:set_string("chariot_pos", minetest.serialize(new_pos))

                            local objects_to_teleport = minetest.get_objects_inside_radius({
                                x = chariot_pos.x + 5,
                                y = chariot_pos.y + 3,
                                z = chariot_pos.z + 5
                            }, 6)

                            new_pos.x = new_pos.x + 4
                            new_pos.y = new_pos.y + 3
                            new_pos.z = new_pos.z + 4

                            for k,v in pairs(objects_to_teleport) do
                                v:set_pos(new_pos)
                            end

                            mex_chariot_ms:set_string("driver", "")
                        end)
                    else
                        minetest.chat_send_player(player_name, "Missing destination.")
                    end
                else
                    minetest.chat_send_player(player_name, "Missing fuel.")
                end
            elseif fields.lights then
                local lamp_position = {}

                lamp_position.x = chariot_pos.x + 4
                lamp_position.y = chariot_pos.y + 6
                lamp_position.z = chariot_pos.z + 4

                if fields.lights == "Lights on" then
                    mex_chariot_ms:set_string("lights", "off")

                    minetest.set_node(lamp_position, {name = "mex_chariot:node"})

                    minetest.show_formspec(player_name, "chariot_navigation", get_control_center_formspec())
                elseif fields.lights == "Lights off" then
                    mex_chariot_ms:set_string("lights", "on")

                    minetest.set_node(lamp_position, {name = "mex_chariot:light"})

                    minetest.show_formspec(player_name, "chariot_navigation", get_control_center_formspec())
                end
            elseif fields.rand_dest_set then
                local destination_pos = {}
                destination_pos.x = math.random(-20000, 20000)
                destination_pos.z = math.random(-20000, 20000)

                if math.random(1, 10) == 5 then
                    destination_pos.y = math.random(-6000, 0)
                else
                    destination_pos.y = math.random(0, 100)
                end

                mex_chariot_ms:set_string("destination_pos", minetest.serialize(destination_pos))
                minetest.show_formspec(player_name, "chariot_navigation", get_control_center_formspec())
            elseif fields.new_dest_set then
                new_dest_X = tonumber(fields.new_dest_X) or 0
                new_dest_Y = tonumber(fields.new_dest_Y) or 0
                new_dest_Z = tonumber(fields.new_dest_Z) or 0
                destination_pos = {x=new_dest_X, y=new_dest_Y, z=new_dest_Z}
                mex_chariot_ms:set_string("destination_pos", minetest.serialize(destination_pos))

                minetest.show_formspec(player_name, "chariot_navigation", get_control_center_formspec())
            elseif fields.abandon then
                mex_chariot_ms:set_string("owner", "")
                minetest.show_formspec(player_name, "chariot_navigation", get_control_center_formspec())
            elseif fields.lock then
                if fields.lock == "Locked" then
                    mex_chariot_ms:set_string("lock", "Unlocked")
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                elseif fields.lock == "Unlocked" then
                    mex_chariot_ms:set_string("lock", "Locked")
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                end
            elseif fields.get_from_octainer then
                if octadrive_inv:contains_item("slot", "mex_chariot:octainer") then
                    local octainer_stack = octadrive_inv:get_stack("slot", 1)
                    mex_chariot_ms:set_string("destination_pos", chariot_pos)

                    if player:get_inventory():room_for_item("main", octainer_stack) then
                        player:get_inventory():add_item("main", octainer_stack)
                    else
                        minetest.add_item(player:get_pos(), octainer_stack)
                    end

                    octadrive_inv:remove_item("slot", octainer_stack)

                    minetest.show_formspec(player_name, "chariot_navigation", get_control_center_formspec())
                end
            elseif fields.engrave then
                if octadrive_inv:contains_item("slot", "default:obsidian") or octadrive_inv:contains_item("slot", "mex_chariot:octainer") then
                    local position = string.gsub(minetest.pos_to_string(chariot_pos, 0), ",", ", ")
                    local octainer_description = "Octainer\n" .. fields.octainer_name .. "\n" .. position
                    local octainer_stack = ItemStack("mex_chariot:octainer")
                    octainer_stack:get_meta():from_table({
                        fields = {
                            description = octainer_description,
                            chariot_pos = chariot_pos
                        }
                    })
                    octainer_stack:get_meta():set_string("key", "valuje")
                    octadrive_inv:set_stack("slot", 1, octainer_stack)
                end
            end
        end
    end
end)


-- Someone contact me when you will be able to place structures without the mapgen "redesigning" it...
minetest.register_node("mex_chariot:init_node", {
    description = "Chariot Init Node",
    tiles = {"mex_chariot_node.png"},
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    on_blast = function(pos, intensity)
        -- Do nothing
    end,
    on_timer = function(pos, elapsed)
        local schematic_path = minetest.get_modpath("mex_chariot") .. "/schematics/chariot.mts"
        for i=-7,6 do
            for j=-5,4 do
                for k=-7,6 do
                    pos.x = pos.x + i
                    pos.y = pos.y + j
                    pos.z = pos.z + k
                    minetest.set_node(pos, {name = "air"})
                    pos.x = pos.x - i
                    pos.y = pos.y - j
                    pos.z = pos.z - k
                end
            end
        end

        pos.x = pos.x - 5
        pos.y = pos.y - 5
        pos.z = pos.z - 5

        minetest.place_schematic(pos, schematic_path, "0", nil, true)

        minetest.set_node(minetest.find_node_near(pos, 10, "mex_chariot:generator"), {name = "mex_chariot:generator"})

        minetest.set_node(minetest.find_node_near(pos, 10, "mex_chariot:octadrive"), {name = "mex_chariot:octadrive"})

        mex_chariot_ms:set_string("chariot_pos", minetest.serialize(pos))
    end,

    on_punch = function(pos, node, puncher, pointed_thing)
        local schematic_path = minetest.get_modpath("mex_chariot") .. "/schematics/chariot.mts"
        for i=-7,6 do
            for j=-5,4 do
                for k=-7,6 do
                    pos.x = pos.x + i
                    pos.y = pos.y + j
                    pos.z = pos.z + k
                    minetest.set_node(pos, {name = "air"})
                    pos.x = pos.x - i
                    pos.y = pos.y - j
                    pos.z = pos.z - k
                end
            end
        end

        pos.x = pos.x - 5
        pos.y = pos.y - 5
        pos.z = pos.z - 5

        minetest.place_schematic(pos, schematic_path, "0", nil, true)

        minetest.set_node(minetest.find_node_near(pos, 10, "mex_chariot:generator"), {name = "mex_chariot:generator"})

        minetest.set_node(minetest.find_node_near(pos, 10, "mex_chariot:octadrive"), {name = "mex_chariot:octadrive"})

        mex_chariot_ms:set_string("chariot_pos", minetest.serialize(pos))
    end,
})


minetest.register_node("mex_chariot:node", {
    description = "Chariot Node",
    tiles = {"mex_chariot_node.png"},
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    on_blast = function(pos, intensity)
        -- Do nothing
    end
})

minetest.register_node("mex_chariot:light", {
    description = "Chariot Light",
    tiles = {"mex_chariot_light.png"},
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    paramtype = "light",
    sunlight_propagates = true,
    light_source = minetest.LIGHT_MAX,
    on_blast = function(pos, intensity)
        -- Do nothing
    end
})

minetest.register_node("mex_chariot:control_center", {
    description = "Chariot Control Center",
    tiles = {
        "mex_chariot_node.png", "mex_chariot_node.png",
        "mex_chariot_node.png", "mex_chariot_node.png",
        "mex_chariot_node.png", "mex_chariot_control_center.png"
    },
    paramtype2 = "facedir",
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if mex_chariot_ms:get_string("owner") == "" then
            mex_chariot_ms:set_string("owner", clicker:get_player_name())
        end

        if mex_chariot_ms:get_string("driver") == "" then
            if mex_chariot_ms:get_string("lock") == "Unlocked" then
                mex_chariot_ms:set_string("driver", clicker:get_player_name())

                minetest.show_formspec(clicker:get_player_name(), "chariot_navigation", get_control_center_formspec(mex_chariot_ms:get_string("brake")))
            else
                if mex_chariot_ms:get_string("owner") == clicker:get_player_name() then
                    mex_chariot_ms:set_string("driver", clicker:get_player_name())

                    minetest.show_formspec(clicker:get_player_name(), "chariot_navigation", get_control_center_formspec(mex_chariot_ms:get_string("brake")))
                end
            end
        end
    end,

    on_blast = function(pos, intensity)
        -- Do nothing
    end
})


local function get_generator_formspec()
	return "size[8,8]"..
        "label[2.8,0;Chariot Generator]"..
        "list[context;input;3,1;2,2;]"..
        "list[current_player;main;0,3.85;8,1;]" ..
		"list[current_player;main;0,5.08;8,3;8]" ..
        "image[3,1;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "image[3,2;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "image[4,1;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "image[4,2;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "listring[current_player;main]"..
        "listring[context;input]"..
        default.get_hotbar_bg(0,3.85)
end


minetest.register_node("mex_chariot:generator", {
    description = "Chariot Generator",
    tiles = {
        "mex_chariot_node.png", "mex_chariot_node.png",
        "mex_chariot_node.png", "mex_chariot_node.png",
        "mex_chariot_node.png", "mex_chariot_generator.png"
    },
    paramtype2 = "facedir",
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec", get_generator_formspec())
        local inv = meta:get_inventory()
        inv:set_size("input", 2 * 2)
    end,

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec", get_generator_formspec())
    end,

    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        if stack:get_name() == "nether_ores:vidore_lump" and
           minetest.get_inventory({type="node", pos=pos}):get_stack("input", index):get_name() == "" then
            return 1
        else
            return 0
        end
    end,

    on_blast = function(pos, intensity)
        -- Do nothing
    end
})


local function get_octadrive_formspec()
	return "size[8,7]"..
        "label[2.9,0;Chariot Octadrive]"..
        "list[context;slot;3.5,1.2;2,2;]"..
        "list[current_player;main;0,2.85;8,1;]" ..
		"list[current_player;main;0,4.08;8,3;8]" ..
        "listring[current_player;main]"..
        "listring[context;slot]"..
        default.get_hotbar_bg(0,2.85)
end


minetest.register_node("mex_chariot:octadrive", {
    description = "Chariot Octadrive",
    tiles = {
        "mex_chariot_node.png", "mex_chariot_node.png",
        "mex_chariot_node.png", "mex_chariot_node.png",
        "mex_chariot_node.png", "mex_chariot_octadrive.png"
    },
    paramtype2 = "facedir",
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec", get_octadrive_formspec())
        local inv = meta:get_inventory()
        inv:set_size("slot", 1)
    end,

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec", get_octadrive_formspec())
    end,

    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        if stack:get_name() == "default:obsidian" or stack:get_name() == "mex_chariot:octainer" and minetest.get_inventory({type="node", pos=pos}):is_empty("slot") then
            return 1
        else
            return 0
        end
    end,

    on_blast = function(pos, intensity)
        -- Do nothing
    end
})


minetest.register_craftitem("mex_chariot:octainer", {
       description = "Octainer",
       inventory_image = "mex_chariot_octainer.png",
       stack_max = 1,
})
