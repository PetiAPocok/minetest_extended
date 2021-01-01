minetest.register_node("mese_miner:miner", {
    description = "Mese Miner",
    drawtype = "mesh",
    mesh = "mese_miner.obj",
    tiles = { "mese_miner.png"},
    inventory_image = "mese_miner_inv.png",
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.9, -0.5, -0.9, 0.9, 0.9, 0.9},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.9, -0.5, -0.9, 0.9, 0.9, 0.9},
        },
    },
    paramtype2 = "facedir",
    groups = {oddly_breakable_by_hand = 1},

    on_construct = function(pos)
        local has_something_in_output = false
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
        "size[8,10]"..
        "image[1,2;1,1;mese_miner_fuel_bg.png]"..
        "list[context;fuel;1,2;1,1;]"..
        "list[context;output;3,1;4,4;]"..
        "list[current_player;main;0,6;8,4;]"..
        "listring[current_player;main]"..
        "listring[context;fuel]"..
        "listring[current_player;main]"..
        "listring[context;output]"..
        "listring[current_player;main]")
        local inv = meta:get_inventory()
        inv:set_size("fuel", 1*1)
        inv:set_size("output", 4*4)
        meta:set_int("mining_sound", -1)
        meta:set_int("mined_depth", 1)
    end,

    allow_metadata_inventory_put = function(pos, listname, index, stack)
        if listname == "fuel" and stack:get_name() == "default:mese_crystal" then
            return stack:get_count()
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
        " moves stuff in mese miner at " .. minetest.pos_to_string(pos))
    end,

    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name() ..
        " puts FUEL to mese miner at " .. minetest.pos_to_string(pos))

        minetest.get_node_timer(pos):start(10)
    end,

    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name() ..
        " takes stuff from mese miner at " .. minetest.pos_to_string(pos))
    end,

    on_timer = function(pos, elapsed)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        local run_again = true
        local has_fuel = false
        local fuel_timer = nil
        local mined_depth = meta:get_int("mined_depth")

        fuel_timer = meta:get_int("fuel_timer")
        if fuel_timer and fuel_timer > 0 then
            has_fuel = true
        end

        if mined_depth < 30 then
            if not has_fuel then
                if not inv:is_empty("fuel") then
                    inv:remove_item("fuel", {name = "default:mese_crystal"})
                    has_fuel = true
                    meta:set_int("fuel_timer", 100)
                else
                    run_again = false
                end
            end
        else
            run_again = false
        end

        fuel_timer = meta:get_int("fuel_timer")
        if fuel_timer and fuel_timer > 0 then
            meta:set_int("fuel_timer", fuel_timer - 10)
            if fuel_timer <= 0 then
                has_fuel = false
            end
        end

        if has_fuel then
            local mine_that_pos = {x = pos.x, y = pos.y - mined_depth, z = pos.z}
            local node_to_mine = minetest.get_node(mine_that_pos).name

            if meta:get_int("mining_sound") == -1 then
                meta:set_int("mining_sound", minetest.sound_play("mese_miner_mining", {pos = pos, gain = 0.5, max_hear_distance = 10, loop = true}))
            end

            if mined_depth < 30 then
                while node_to_mine == "air" do
                    meta:set_int("mined_depth", mined_depth + 1)
                    mined_depth = mined_depth + 1
                    mine_that_pos = {x = pos.x, y = pos.y - mined_depth, z = pos.z}
                    node_to_mine = minetest.get_node(mine_that_pos).name
                end

                if node_to_mine ~= "air" then
                    minetest.remove_node(mine_that_pos)
                    if inv:room_for_item("output", {name = node_to_mine}) then
                        inv:add_item("output", {name = node_to_mine})

                        -- Add random ore
                        local rand_num = math.random(1, 100)
                        if pos.y < 16 and rand_num == 1 then
                            inv:add_item("output", {name = "default:coal_lump"})
                        end

                        if pos.y < -16 then
                            if rand_num == 2 then
                                inv:add_item("output", {name = "default:tin_lump"})
                            end

                            if rand_num == 3 then
                                inv:add_item("output", {name = "default:copper_lump"})
                            end
                        end

                        if pos.y < -64 and rand_num == 4 then
                            inv:add_item("output", {name = "default:iron_lump"})
                        end

                        if pos.y < -128 then
                            if rand_num == 5 then
                                inv:add_item("output", {name = "default:gold_lump"})
                            end

                            if rand_num == 6 then
                                inv:add_item("output", {name = "default:mese_crystal"})
                            end
                        end

                        if pos.y < -256 and rand_num == 6 then
                            inv:add_item("output", {name = "default:diamond"})
                        end
                    end
                end
            else
                run_again = false
            end
        end

        if not run_again then
            minetest.sound_stop(meta:get_int("mining_sound"))
            meta:set_int("mining_sound", -1)
        end

        return run_again
    end,

    on_destruct = function(pos)
        minetest.sound_stop(minetest.get_meta(pos):get_int("mining_sound"))
        local drop = ""
        local temp = {}

        default.get_inventory_drops(pos, "fuel", temp)
        default.get_inventory_drops(pos, "output", temp)

        for i,v in ipairs(temp) do
            drop = v.name .. " " .. v.count
            minetest.add_item(pos, drop)
        end
    end,
})

minetest.register_craft({
    output = "mese_miner:miner",
    recipe = {
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
        {"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
        {"default:steel_ingot", "default:diamond", "default:steel_ingot"},
    }
})
