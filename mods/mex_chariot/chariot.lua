local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if mex_chariot_ms:get_string("placed") ~= "true" and minp.y <= -5100 and
           minp.x <= 42 and maxp.x >= 42 and
           minp.z <= 42 and maxp.z >= 42 then
            local schematic_path = minetest.get_modpath("mex_chariot") .. "/schematics/chariot.mts"
            local pos = {x=42, y=-5420, z=42}
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

            mex_chariot_ms:set_string("placed", "true")
        end
    end)
end
