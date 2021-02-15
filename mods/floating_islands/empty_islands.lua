local island_height = 1000
local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if minp.y >= island_height then
            if math.random(1, 500) == 42 then
                local pos = table.copy(minp)
                local layer_size = 3

                minetest.set_node(pos, {name = "default:stone"})

                while layer_size <= 17 do
                    local random_layer_height = math.random(1, layer_size)

                    for i = 1, random_layer_height do
                        pos.y = pos.y + 1
                        floating_islands.rectangular_layer(pos, layer_size, layer_size, "default:stone")
                    end

                    layer_size = layer_size + 2
                end

                pos.y = pos.y + 1
                floating_islands.rectangular_layer_top(pos, 17, 17)
            end
        end
    end)
end
