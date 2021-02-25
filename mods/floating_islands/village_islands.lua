local village_farm_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_farm.mts"
local village_house_big_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_house_big.mts"
local village_house_small_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_house_small.mts"
local village_kitchen_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_kitchen.mts"
local village_lamp_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_lamp.mts"
local village_paddock_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_paddock.mts"
local village_temple_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_temple.mts"
local village_well_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/village_well.mts"

local island_height = 1000
local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if minp.y >= island_height then
            if math.random(1, 400) == 42 then
                local pos = table.copy(minp)

                for i = 1, 7 do
                    floating_islands.rectangular_layer(pos, i * 5, i * 5, "default:dirt")
                    pos.y = pos.y + 1
                end

                floating_islands.rectangular_layer_top(pos, 40, 40)


                --And now the actual village
                pos.x = pos.x - 17
                pos.z = pos.z - 15
                for i=1,32 do
                    for j=1,32 do
                        pos.x = pos.x + i
                        pos.z = pos.z + j
                        --Road
                        if i == 15 or i == 16 or j == 15 or j == 16 or
                           i == 12 and j == 12 or i == 12 and j == 13 or
                           i == 12 and j == 14 or i == 12 and j == 17 or
                           i == 12 and j == 18 or i == 12 and j == 19 or
                           i == 13 and j == 12 or i == 13 and j == 13 or
                           i == 13 and j == 14 or i == 13 and j == 17 or
                           i == 13 and j == 18 or i == 13 and j == 19 or
                           i == 14 and j == 12 or i == 14 and j == 13 or
                           i == 14 and j == 18 or i == 14 and j == 19 or
                           i == 17 and j == 12 or i == 17 and j == 13 or
                           i == 17 and j == 18 or i == 17 and j == 19 or
                           i == 18 and j == 12 or i == 18 and j == 13 or
                           i == 18 and j == 14 or i == 18 and j == 17 or
                           i == 18 and j == 18 or i == 18 and j == 19 or
                           i == 19 and j == 12 or i == 19 and j == 13 or
                           i == 19 and j == 14 or i == 19 and j == 17 or
                           i == 19 and j == 18 or i == 19 and j == 19 then
                            minetest.set_node(pos, {name = "default:desert_stonebrick"})
                        end

                        --Structures
                        pos.y = pos.y + 1

                        --Small houses
                        if i == 1 and j == 17 or i == 7 and j == 17 then
                            pos.x = pos.x - 1
                            minetest.place_schematic(pos, village_house_small_schematic_path, "180", nil, true)
                            local replaceable_node_pos = minetest.find_node_near(pos, 10, "mex_morebeds:npc_bed")
                            minetest.set_node(replaceable_node_pos, {name = "mex_morebeds:npc_bed", param2 = 0})
                            pos.x = pos.x + 1
                        elseif i == 1 and j == 8 or i == 7 and j == 8 then
                            pos.x = pos.x - 1
                            minetest.place_schematic(pos, village_house_small_schematic_path, "0", nil, true)
                            local replaceable_node_pos = minetest.find_node_near(pos, 10, "mex_morebeds:npc_bed")
                            minetest.set_node(replaceable_node_pos, {name = "mex_morebeds:npc_bed", param2 = 2})
                            pos.x = pos.x + 1
                        end

                        --Farms
                        if i == 17 and j == 26 then
                            pos.y = pos.y - 1
                            minetest.place_schematic(pos, village_farm_schematic_path, "90", nil, true)
                            pos.y = pos.y + 1
                        end

                        if i == 28 and j == 17 then
                            pos.y = pos.y - 1
                            minetest.place_schematic(pos, village_farm_schematic_path, "0", nil, true)
                            pos.y = pos.y + 1
                        end

                        --Paddock
                        if i == 5 and j == 25 then
                            minetest.place_schematic(pos, village_paddock_schematic_path, "180", nil, true)
                        end

                        --Kitchen
                        if i == 17 and j == 1 then
                            pos.z = pos.z - 3
                            minetest.place_schematic(pos, village_kitchen_schematic_path, "0", nil, true)

                            replaceable_node_pos = minetest.find_node_near(pos, 20, "default:steelblock")
                            minetest.set_node(replaceable_node_pos, {name = "default:furnace", param2 = 2})

                            replaceable_node_pos = minetest.find_node_near(pos, 20, "default:goldblock")
                            minetest.set_node(replaceable_node_pos, {name = "alchemy:alchemy_set", param2 = 2})

                            replaceable_node_pos = minetest.find_node_near(pos, 20, "default:tinblock")
                            minetest.set_node(replaceable_node_pos, {name = "farming:packer"})

                            replaceable_node_pos = minetest.find_node_near(pos, 20, "doors:door_aspen_6_a")
                            replaceable_node_pos.z = replaceable_node_pos.z - 1
                            if minetest.get_node(replaceable_node_pos).name == "doors:door_aspen_6_c" then
                                minetest.set_node(replaceable_node_pos, {name = "doors:door_aspen_6_b", param2 = 1})
                            end

                            pos.z = pos.z + 3
                        end

                        --Lamps
                        if i == 5 and j == 17 or i == 17 and j == 25 or i == 14 and j == 9 or i == 28 and j == 14  then
                            minetest.place_schematic(pos, village_lamp_schematic_path, "0", nil, true)
                        end

                        pos.y = pos.y - 1

                        pos.x = pos.x - i
                        pos.z = pos.z - j
                    end
                end

                --well
                pos.x = pos.x + 14
                pos.y = pos.y - 5
                pos.z = pos.z + 14
                minetest.place_schematic(pos, village_well_schematic_path, "0", nil, true)

            end
        end
    end)
end
