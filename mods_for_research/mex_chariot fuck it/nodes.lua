function get_control_center_formspec()
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

    local brake = mex_chariot_ms:get_string("brake")
    if brake == "" then
        mex_chariot_ms:set_string("brake", "Pulled")
        brake = "Pulled"
    end

    local lock = mex_chariot_ms:get_string("lock")
    if lock == "" then
        mex_chariot_ms:set_string("lock", "Unlocked")
        lock = "Unlocked"
    end

    local lights = mex_chariot_ms:get_string("lights")
    if lights == "" then
        mex_chariot_ms:set_string("lights", "on")
        lights = "on"
    end

    -- <X>,<Y>;<W>,<H>
    return "size[10,6]"..
        "label[3.8,0;Chariot Control]"..
        "label[0,1;Owner:\n" .. owner .. "]"..
        "label[0,2;Current position:\n" .. position .. "]"..
        "label[0,3;Biome:\n" .. biome_name .. "]"..
        "button[0,4;3,1;brake;Brake " .. brake .. "]"..
        "button[3.4,1;3,1;rand_dest_set;Random coordinates]"..
        "label[3.1,2;New destination coordinates:]"..
        "field[3.6,3;1.2,1;new_dest_X;X:;" .. new_dest_X .. "]"..
        "field[4.6,3;1.2,1;new_dest_Y;Y:;" .. new_dest_Y .. "]"..
        "field[5.6,3;1.2,1;new_dest_Z;Z:;" .. new_dest_Z .. "]"..
        "button[3.4,4;3,1;new_dest_set;Set]"..
        "label[6.7,1.3;Destination coordinates:\n" .. destination_position .. "]"..
        "label[6.7,2.6;Destination biome:\n" .. destination_biome_name .. "]"..
        "button[6.8,4;3,1;check;Check]"..
        "button[0,5.2;3,1;lock;" .. lock .. "]"..
        "button[3.4,5.2;3,1;lights;Lights " .. lights .. "]"..
        "button[6.8,5.2;3,1;travel;Travel]"..
        ""
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "chariot_navigation" then
        if fields then
            local player_name = player:get_player_name()

            if fields.quit == "true" then
                mex_chariot_ms:set_string("driver", "")
            elseif fields.travel then
                if mex_chariot_ms:get_string("brake") == "Released" then
                    if mex_chariot_ms:get_int("fuel") >= 1 then
                        minetest.remove_node(minetest.deserialize(mex_chariot_ms:get_string("chariot_pos")))

                        minetest.set_node(minetest.deserialize(mex_chariot_ms:get_string("destination_pos")), {name = "mex_chariot:chariot_node"})

                        mex_chariot_ms:set_string("chariot_pos", mex_chariot_ms:get_string("destination_pos"))
                    else
                        minetest.chat_send_player(player_name, "Missing fuel.")
                    end
                else
                    minetest.chat_send_player(player_name, "Brake pulled.")
                end
            elseif fields.brake then
                local chariot_pos = minetest.deserialize(mex_chariot_ms:get_string("chariot_pos"))
                local timer = minetest.get_node_timer(chariot_pos)

                if fields.brake == "Brake Pulled" then
                    mex_chariot_ms:set_string("brake", "Released")
                    timer:start(0.001)
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                elseif fields.brake == "Brake Released" then
                    mex_chariot_ms:set_string("brake", "Pulled")
                    timer:stop()
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                end
            elseif fields.lock then
                if fields.lock == "Locked" then
                    mex_chariot_ms:set_string("lock", "Unlocked")
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                elseif fields.lock == "Unlocked" then
                    mex_chariot_ms:set_string("lock", "Locked")
                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                end
            elseif fields.lights then
                local lamp_positions = {
                    {x=7, y=20004, z=1},
                    {x=1, y=20004, z=7},
                    {x=13, y=20004, z=7},
                    {x=7, y=20004, z=13},
                    {x=10, y=20005, z=4},
                    {x=4, y=20005, z=4},
                    {x=4, y=20005, z=10},
                    {x=10, y=20005, z=10},
                    {x=9, y=20006, z=7},
                    {x=7, y=20006, z=5},
                    {x=5, y=20006, z=7},
                    {x=7, y=20006, z=9},
                }

                -- local lamp_positions = minetest.find_nodes_in_area(pos1, pos2, {"mesecons_lightstone:lightstone_white_on", "mesecons_lightstone:lightstone_white_off"})

                if fields.lights == "Lights on" then
                    mex_chariot_ms:set_string("lights", "off")

                    for i,v in ipairs(lamp_positions) do
                        minetest.set_node(v, {name = "mesecons_lightstone:lightstone_white_off"})
                    end

                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                elseif fields.lights == "Lights off" then
                    mex_chariot_ms:set_string("lights", "on")

                    for i,v in ipairs(lamp_positions) do
                        minetest.set_node(v, {name = "mesecons_lightstone:lightstone_white_on"})
                    end

                    minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
                end
            elseif fields.rand_dest_set then
                local destination_pos = {}
                destination_pos.x = math.random(-20000, 20000)
                destination_pos.z = math.random(-20000, 20000)

                if math.random(1, 10) == 5 then
                -- if 1 then

                    destination_pos.y = math.random(-6000, 0)

                    minetest.log(dump(minetest.get_node(destination_pos).name))
                    -- destination_pos_candidate = minetest.find_node_near(destination_pos, 100, "ignore")
                    -- destination_pos_candidate = minetest.find_node_near(destination_pos, 100, "air")
                else
                    destination_pos.y = math.random(0, 300)

                    local pos1 = table.copy(destination_pos)
                    pos1.x = pos1.x - 10
                    pos1.y = pos1.y - 10
                    pos1.z = pos1.z - 10

                    local pos2 = table.copy(destination_pos)
                    pos2.x = pos2.x + 10
                    pos2.y = pos2.y + 10
                    pos2.z = pos2.z + 10

                    minetest.load_area(pos1, pos2)

                    if minetest.get_node(destination_pos).name == "ignore" or minetest.get_node(destination_pos).name == "air" then
                        while destination_pos.y >= 0 and minetest.get_node(destination_pos).name == "ignore" or minetest.get_node(destination_pos).name == "air" do

                            minetest.log(dump(minetest.get_node(destination_pos).name))

                            minetest.log(destination_pos.y)
                            destination_pos.y = destination_pos.y - 1
                        end
                        destination_pos.y = destination_pos.y + 2
                    else
                        minetest.log("talaj")
                    end
                end

                minetest.log("Destination pos: " .. dump(destination_pos))

                -- mex_chariot_ms:set_string("destination_pos", minetest.serialize(destination_pos))
                minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
            elseif fields.new_dest_set then
                new_dest_X = tonumber(fields.new_dest_X)
                new_dest_Y = tonumber(fields.new_dest_Y)
                new_dest_Z = tonumber(fields.new_dest_Z)
                destination_pos = {x=new_dest_X, y=new_dest_Y, z=new_dest_Z}
                mex_chariot_ms:set_string("destination_pos", minetest.serialize(destination_pos))

                minetest.show_formspec(player:get_player_name(), "chariot_navigation", get_control_center_formspec())
            elseif fields.rooms then
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
    paramtype2 = "facedir",
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.7, -0.5, -0.5, 0.7, -0.4, 0.5},
            {-0.5, -0.5, -0.85, 0.5, -0.4, 0.85},
            {-0.8, -0.5, 0.55, -0.55, 1.4, 0.25},
            {-0.12, -0.5, -0.85, 0.12, 1.4, -0.65},
            {0.8, -0.5, 0.25, 0.55, 1.4, 0.5},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.7, -0.5, -0.5, 0.7, -0.4, 0.5},
            {-0.5, -0.5, -0.85, 0.5, -0.4, 0.85},
            {-0.8, -0.5, 0.55, -0.55, 1.4, 0.25},
            {-0.12, -0.5, -0.85, 0.12, 1.4, -0.65},
            {0.8, -0.5, 0.25, 0.55, 1.4, 0.5},
        },
    },
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if mex_chariot_ms:get_string("owner") == "" then
            mex_chariot_ms:set_string("owner", clicker:get_player_name())
        end

        if mex_chariot_ms:get_string("driver") == "" then
            mex_chariot_ms:set_string("driver", clicker:get_player_name())

            pos.y = pos.y + 0.5
            clicker:set_pos(pos)
            pos.y = pos.y - 0.5
            clicker:set_look_vertical(0)
            clicker:set_look_horizontal(3.14)

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
        minetest.set_node({x = 7, y = 20008, z = 7}, {name = "mesecons_lightstone:lightstone_blue_on"})

        mex_chariot_ms:set_int("fuel", mex_chariot_ms:get_int("fuel") + stack:get_count())
    end,

    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        mex_chariot_ms:set_int("fuel", mex_chariot_ms:get_int("fuel") - stack:get_count())

        if mex_chariot_ms:get_int("fuel") < 0 then
            mex_chariot_ms:set_int("fuel", 0)
        end

        if mex_chariot_ms:get_int("fuel") < 1 then
            minetest.set_node({x = 7, y = 20008, z = 7}, {name = "mesecons_lightstone:lightstone_blue_off"})
        end
    end,
})

minetest.register_node("mex_chariot:door", {
    description = "Chariot Door",
    tiles = {"mex_chariot_door.png"},
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if itemstack:get_name() == "default:obsidian" then
            local inv = clicker:get_inventory()

            if inv:room_for_item("main", {name = "mex_chariot:key"}) then
                inv:add_item("main", {name = "mex_chariot:key"})
            else
                minetest.add_item(pos, {name = "mex_chariot:key"})
            end

            itemstack:take_item(1)
        else
            if mex_chariot_ms:get_string("brake") == "Pulled" then
                local position = table.copy(minetest.deserialize(mex_chariot_ms:get_string("chariot_pos")))
                position.x = position.x + 2
                clicker:set_pos(position)
            else
                minetest.chat_send_player(clicker:get_player_name(), "Chariot in motion. Pull break.")
            end
        end
    end,
})

minetest.register_craftitem("mex_chariot:key", {
    description = "Chariot Key",
    inventory_image = "mex_chariot_key.png",
    groups = {not_in_creative_inventory = 1},
    stack_max = 1,
})
