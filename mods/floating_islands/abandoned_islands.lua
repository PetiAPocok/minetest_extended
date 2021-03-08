local schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/abandoned_house.mts"
local island_height = 1000
local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if minp.y >= island_height and maxp.y < 10000 then
            if math.random(1, 250) == 42 then
                local pos = table.copy(minp)
                local layer_size = 3

                minetest.set_node(pos, {name = "default:stone"})

                while layer_size <= 17 do
                    local random_layer_height = math.random(1, math.floor(layer_size / 3))

                    for i = 1, random_layer_height do
                        pos.y = pos.y + 1
                        floating_islands.rectangular_layer(pos, layer_size, layer_size, "default:stone")
                    end

                    layer_size = layer_size + 2
                end

                pos.y = pos.y + 1
                floating_islands.rectangular_layer_top(pos, 17, 17)

                --position correction for nice schematic placement
                pos.x = pos.x - 6
                pos.y = pos.y + 1
                pos.z = pos.z - 1
                --minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
                minetest.place_schematic(pos, schematic_path, "0", nil, true)
            end
        end
    end)
end
