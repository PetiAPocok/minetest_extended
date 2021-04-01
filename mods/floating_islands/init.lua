local mod_path = minetest.get_modpath(minetest.get_current_modname())

floating_islands = {}

floating_islands.rectangular_layer = function(pos, width, length, node)
    local width_floor = -math.floor(width / 2)
    local width_ceil = math.floor(width / 2)
    local length_floor = -math.floor(length / 2)
    local length_ceil = math.floor(length / 2)


    for i = width_floor, width_ceil do
        for j = length_floor, length_ceil do
            pos.x = pos.x + i
            pos.z = pos.z + j
            minetest.set_node(pos, {name = node})
            pos.x = pos.x - i
            pos.z = pos.z - j
        end
    end
end

floating_islands.rectangular_layer_top = function(pos, width, length)
    local width_floor = -math.floor(width / 2)
    local width_ceil = math.floor(width / 2)
    local length_floor = -math.floor(length / 2)
    local length_ceil = math.floor(length / 2)

    for i = width_floor, width_ceil do
        for j = length_floor, length_ceil do
            pos.x = pos.x + i
            pos.z = pos.z + j

            local biome = minetest.get_biome_name(minetest.get_biome_data(pos).biome)
            if biome == "grassland" or biome == "deciduous_forest" then
                minetest.set_node(pos, {name = "default:dirt_with_grass"})
            elseif biome == "coniferous_forest" then
                minetest.set_node(pos, {name = "default:dirt_with_coniferous_litter"})
            elseif biome == "desert" then
                minetest.set_node(pos, {name = "default:desert_sand"})
            elseif biome == "savanna" then
                minetest.set_node(pos, {name = "default:dry_dirt_with_dry_grass"})
            elseif biome == "taiga" or biome == "tundra_highland" or biome == "snowy_grassland" then
                minetest.set_node(pos, {name = "default:dirt_with_snow"})
            elseif biome == "rainforest" then
                minetest.set_node(pos, {name = "default:dirt_with_rainforest_litter"})
            elseif biome == "cold_desert" then
                minetest.set_node(pos, {name = "default:silver_sand"})
            elseif biome == "sandstone_desert" then
                minetest.set_node(pos, {name = "default:sand"})
            elseif biome == "icesheet" then
                minetest.set_node(pos, {name = "default:snowblock"})
            else
                minetest.log(dump(biome))
            end

            pos.x = pos.x - i
            pos.z = pos.z - j
        end
    end
end

dofile(mod_path .. "/empty_islands.lua")
dofile(mod_path .. "/abandoned_islands.lua")
dofile(mod_path .. "/occupied_islands.lua")
dofile(mod_path .. "/village_islands.lua")
