local mp = minetest.get_modpath("mex_chariot")
mex_chariot_ms = minetest.get_mod_storage()

minetest.register_on_shutdown(function()
    local meta = minetest.get_meta(minetest.deserialize(mex_chariot_ms:get_string("chariot_pos")))
    meta:set_string("driver", "")
end)

minetest.register_on_leaveplayer(function(player)
    local player_name = player:get_player_name()
    local meta = minetest.get_meta(minetest.deserialize(mex_chariot_ms:get_string("chariot_pos")))

    if meta:get_string("driver") == player_name then
        meta:set_string("driver", "")
    end
end)

dofile(mp .. "/nodes.lua")
dofile(mp .. "/chariot_entity.lua")
dofile(mp .. "/chariot_node.lua")
