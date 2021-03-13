local function get_control_center_formspec(brake)
    local pos = minetest.deserialize(mex_chariot_ms:get_string("chariot_pos"))
    local position = string.gsub(minetest.pos_to_string(pos, 0), ",", ", ")
    local biome_name = ""
    local biome_raw = minetest.get_biome_name(minetest.get_biome_data(pos).biome)
    biome_raw = biome_raw:gsub("_", " ")

    for word in biome_raw:gmatch("%w+") do
        biome_name = biome_name .. word:gsub("^%l", string.upper) .. " "
    end

    return "size[8,3]"..
        "label[2.8,0;Chariot Control]"..
        "label[0,1;Position:\n" .. position .. "]"..
        "button[0,2;3,1;drive;Drive]"..
        "label[5,1;Biome:\n" .. biome_name .. "]"..
        "button[5,2;3,1;brake;Brake " .. brake .. "]"
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "chariot_navigation" then
        if fields then
            local pos = minetest.deserialize(mex_chariot_ms:get_string("chariot_pos"))
            local meta = minetest.get_meta(pos)
            local player_name = player:get_player_name()

            if fields.quit == "true" then
                meta:set_string("driver", "")
            elseif fields.drive then
                if mex_chariot_ms:get_string("brake") == "Released" then
                    if mex_chariot_ms:get_int("fuel") >= 1 then
                        local obj = minetest.get_objects_inside_radius(pos, 30)
                        minetest.log(dump(obj))
                    	player_api.player_attached[player_name] = true
                        player:set_attach(obj, "", {x=0, y=0, z=0}, {x=0, y=0, z=0}, true)
                        minetest.close_formspec(player_name, formname)
                    else
                        minetest.chat_send_player(player_name, "Missing fuel.")
                    end
                else
                    minetest.chat_send_player(player_name, "Brake pulled.")
                end
            elseif fields.brake then
                if fields.brake == "Brake Pulled" then
                    mex_chariot_ms:set_string("brake", "Released")
                    minetest.remove_node(pos)
                    minetest.add_entity(pos, "mex_chariot:chariot_entity")
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec(mex_chariot_ms:get_string("brake")))
                elseif fields.brake == "Brake Released" then
                    mex_chariot_ms:set_string("brake", "Pulled")
                    pos.y = pos.y + 1
                    minetest.place_node(pos, {name = "mex_chariot:chariot_node"})
                    pos.y = pos.y - 1
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec(mex_chariot_ms:get_string("brake")))
                end
            end
        end
    end
end)

minetest.register_node("mex_chariot:control_center", {
    description = "Chariot Control Panel",
    drawtype = "mesh",
    mesh = "mex_chariot_control_center.obj",
    tiles = {"mex_chariot_control_center.png"},
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    walakable = true,
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.8, -0.5, -0.5, 0.8, -0.4, 0.5},
            {-0.5, -0.5, -0.7, 0.5, -0.4, 0.7},
            {-0.85, -0.5, -0.1, -0.7, 1.4, 0.1},
            {0.27, -0.5, -0.8, 0.46, 1.4, -0.55},
            {0.27, -0.5, 0.8, 0.5, 1.4, 0.55},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.8, -0.5, -0.5, 0.8, -0.4, 0.5},
            {-0.5, -0.5, -0.7, 0.5, -0.4, 0.7},
            {-0.85, -0.5, -0.1, -0.7, 1.4, 0.1},
            {0.27, -0.5, -0.8, 0.46, 1.4, -0.55},
            {0.27, -0.5, 0.8, 0.5, 1.4, 0.55},
        },
    },
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local meta = minetest.get_meta(minetest.deserialize(mex_chariot_ms:get_string("chariot_pos")))

        if meta:get_string("driver") == "" then
            meta:set_string("driver", clicker:get_player_name())

            pos.y = pos.y + 0.5
            clicker:set_pos(pos)
            pos.y = pos.y - 0.5

            minetest.show_formspec(clicker:get_player_name(), "chariot_navigation", get_control_center_formspec(mex_chariot_ms:get_string("brake")))
        end
    end,
})

local function get_generator_formspec()
	return "size[8,8]"..
        "label[2.8,0;Chariot Generator]"..
        "list[context;input;3,1;2,2;]"..
        "image[3,1;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "image[3,2;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "image[4,1;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "image[4,2;1,1;nether_ores_vidore_lump.png^[opacity:128]"..
        "list[current_player;main;0,4;8,4;]"..
        "listring[current_player;main]"..
        "listring[context;input]"
end

minetest.register_node("mex_chariot:generator", {
    description = "Chariot Generator",
    tiles = {"mex_chariot_generator.png"},
    groups = {not_in_creative_inventory = 1, mesecon_needs_receiver = 1},
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
        if stack:get_name() == "nether_ores:vidore_lump" then
            return stack:get_count()
        else
            return 0
        end
    end,

    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        local lamp_positions = {
            {x = 4, y = 20000, z = 11},
            {x = 4, y = 20005, z = 11},
        }

        for i,v in ipairs(lamp_positions) do
            minetest.set_node(v, {name = "mesecons_lightstone:lightstone_blue_on"})
        end
    end,

    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        local inv = minetest.get_meta(pos):get_inventory()
        local fuel_amount = 0

        for i,v in ipairs(inv:get_list("input")) do
            fuel_amount = fuel_amount + v:get_count()
        end

        if fuel_amount < 1 then
            local lamp_positions = {
                {x = 4, y = 20000, z = 11},
                {x = 4, y = 20005, z = 11},
            }
            for i,v in ipairs(lamp_positions) do
                minetest.set_node(v, {name = "mesecons_lightstone:lightstone_blue_off"})
            end
        end
    end,
})

minetest.register_node("mex_chariot:door", {
    description = "Chariot Door",
    tiles = {"mex_chariot_door.png"},
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if mex_chariot_ms:get_string("brake") == "Pulled" then
            local position = table.copy(minetest.deserialize(mex_chariot_ms:get_string("chariot_pos")))
            position.x = position.x + 2
            clicker:set_pos(position)
        end
    end,
})
