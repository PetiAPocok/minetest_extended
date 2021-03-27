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
dofile(mp .. "/chariot.lua")
