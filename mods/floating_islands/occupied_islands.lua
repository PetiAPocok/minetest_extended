local iglu_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/iglu.mts"
local stone_house_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/stone_house.mts"
local desert_house_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/desert_house.mts"
local pyramid_house_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/pyramid_house.mts"
local silver_tower_schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/silver_tower.mts"
local island_height = 1000
local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if minp.y >= island_height and maxp.y < 10000 then
            if math.random(1, 400) == 42 then
                local pos = table.copy(minp)
                local layer_size = 3

                minetest.set_node(pos, {name = "default:stone"})

                while layer_size <= 19 do
                    local random_layer_height = math.random(1, math.floor(layer_size / 2))

                    for i = 1, random_layer_height do
                        pos.y = pos.y + 1
                        floating_islands.rectangular_layer(pos, layer_size, layer_size, "default:stone")
                    end

                    layer_size = layer_size + 2
                end

                pos.y = pos.y + 1
                floating_islands.rectangular_layer_top(pos, 19, 19)

                local biome = minetest.get_biome_name(minetest.get_biome_data(pos).biome)
                if biome == "desert" or biome == "savanna" then
                    --position correction for nice schematic placement
                    pos.x = pos.x - 4
                    pos.y = pos.y + 1
                    pos.z = pos.z - 6
                    --minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
                    minetest.place_schematic(pos, desert_house_schematic_path, "0", nil, true)

                    local replaceable_node_pos = minetest.find_node_near(pos, 10, "default:steelblock")
                    minetest.set_node(replaceable_node_pos, {name = "default:furnace", param2 = 3})

                    local replaceable_node_pos = minetest.find_node_near(pos, 10, "default:goldblock")
                    minetest.set_node(replaceable_node_pos, {name = "alchemy:alchemy_set", param2 = 3})
                elseif biome == "taiga" or biome == "tundra_highland" or biome == "snowy_grassland" or biome == "icesheet" then
                    --position correction for nice schematic placement
                    pos.x = pos.x - 6
                    pos.y = pos.y + 1
                    pos.z = pos.z - 7
                    --minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
                    minetest.place_schematic(pos, iglu_schematic_path, "0", nil, true)

                    local replaceable_node_pos = minetest.find_node_near(pos, 10, "default:steelblock")
                    minetest.set_node(replaceable_node_pos, {name = "default:furnace", param2 = 3})

                    local replaceable_node_pos = minetest.find_node_near(pos, 10, "default:goldblock")
                    minetest.set_node(replaceable_node_pos, {name = "alchemy:alchemy_set", param2 = 3})
                elseif biome == "cold_desert" then
                    --position correction for nice schematic placement
                    pos.x = pos.x - 6
                    pos.y = pos.y + 1
                    pos.z = pos.z - 1
                    --minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
                    minetest.place_schematic(pos, silver_tower_schematic_path, "0", nil, true)
                elseif biome == "sandstone_desert" then
                    --position correction for nice schematic placement
                    pos.x = pos.x - 6
                    pos.y = pos.y + 1
                    pos.z = pos.z - 1
                    --minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
                    minetest.place_schematic(pos, pyramid_house_schematic_path, "0", nil, true)
                else
                    --position correction for nice schematic placement
                    pos.x = pos.x - 6
                    pos.y = pos.y + 1
                    pos.z = pos.z - 1
                    --minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
                    minetest.place_schematic(pos, stone_house_schematic_path, "0", nil, true)

                    local replaceable_node_pos = minetest.find_node_near(pos, 10, "default:steelblock")
                    minetest.set_node(replaceable_node_pos, {name = "default:furnace", param2 = 2})

                    local replaceable_node_pos = minetest.find_node_near(pos, 10, "default:goldblock")
                    minetest.set_node(replaceable_node_pos, {name = "alchemy:alchemy_set", param2 = 2})
                end
            end
        end
    end)
end
