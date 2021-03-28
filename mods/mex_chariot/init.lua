local mp = minetest.get_modpath("mex_chariot")
mex_chariot_ms = minetest.get_mod_storage()

minetest.register_on_shutdown(function()
    mex_chariot_ms:set_string("driver", "")
end)

minetest.register_on_leaveplayer(function(player)
    local player_name = player:get_player_name()

    if mex_chariot_ms:get_string("driver") == player_name then
        mex_chariot_ms:set_string("driver", "")
    end
end)

dofile(mp .. "/nodes.lua")


local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if mex_chariot_ms:get_string("placed") ~= "true" and
           minp.x <= 42 and maxp.x >= 42 and
           minp.y <= -5420 and maxp.y >= -5420 and
           minp.z <= 42 and maxp.z >= 42 then
               local pos = {x=42, y=-5420, z=42}
               minetest.set_node(pos, {name = "mex_chariot:init_node"})
               minetest.get_node_timer(pos):start(1)
               mex_chariot_ms:set_string("placed", "true")
        end
    end)
end
