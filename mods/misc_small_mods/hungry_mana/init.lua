local timer = 0

minetest.register_globalstep(function(dtime)
    timer = timer + dtime;

    if timer > 1 then
        for _, player in ipairs(minetest.get_connected_players()) do
	        local name = player:get_player_name()

            if hbhunger.players[name].hunger < 9.9 then
                hbmana.setregen(name, 0)
            else
                hbmana.setregen(name, hbmana.settings.default_regen)
            end
        end

        timer = 0
    end
end)
