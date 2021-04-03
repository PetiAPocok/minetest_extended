local weather_change_timer = 0
local weather_update_timer = 0
local weather = "sunny"
local sound_playing = {}

minetest.register_privilege("weather", "Allows to change weather.")

minetest.register_chatcommand("weather", {
    params = "<weather type>",
    description = "Sets the weather to rainy/stormy/sunny.",
    privs = {weather=true},
    func = function(name, param)
        if param == "rainy" or
           param == "stormy" or
           param == "sunny" then
            weather = param
            weather_change_timer = 0
        else
            return false, "Invalid weather type. Try rainy/stormy/sunny."
       end
    end,
})

local function under_cover(pos)
    for i=1, 50 do
        pos.y = pos.y + i

        if minetest.get_node(pos).name ~= "air" and minetest.get_node(pos).name ~= "ignore" then
            return false
        end

        pos.y = pos.y - i
    end
    return true
end

minetest.register_globalstep(function(dtime)
    if weather_change_timer > 180 then
        local random_weather = math.random(1, 100)

        if random_weather == 1 then
            weather = "rainy"
        elseif random_weather == 2 then
            weather = "stormy"
        else
            weather = "sunny"
        end

        weather_change_timer = 0
    end

    -- Change weather
    if weather_update_timer > 1 then
        local time = minetest.get_timeofday() * 24000

        for _, player in ipairs(minetest.get_connected_players()) do
            local player_pos = player:get_pos()
            local player_name = player:get_player_name()
            local temperature = minetest.get_heat(player_pos) -- Frozen below 35

            if weather == "rainy" then
                player:set_sky({
                    base_color = {},
                    type = "regular",
                    clouds = true,
                })

                player:set_sun({
                    visible = false,
                    sunrise_visible = false,
                })

                player:set_moon({
                    visible = false,
                })

                player:set_stars({
                    visible = false,
                })

                player:set_clouds({
                    density = 0.75,
                    color = {a=255, r=200, g=200, b=200},
                })

                if player_pos.y > -40 and under_cover(player_pos) then
                    if temperature < 35 then
                        minetest.add_particlespawner({
                            amount = 1500,
                            time = 1,
                            attached = player,
                            minpos = {x=-15, y=5, z=-15},
                            maxpos = {x=15, y=10, z=15},
                            minvel = {x=0, y=-1, z=0},
                            maxvel = {x=0, y=-5, z=0},
                            minacc = {x=0, y=0, z=0},
                            maxacc = {x=0, y=0, z=0},
                            minexptime = 3,
                            maxexptime = 5,
                            minsize = 0.1,
                            maxsize = 1,
                            collisiondetection = true,
                            object_collision = true,
                            collision_removal = true,
                            vertical = true,
                            texture = "weather_snow.png",
                        })
                    else
                        minetest.add_particlespawner({
                            amount = 1000,
                            time = 1,
                            attached = player,
                            minpos = {x=-15, y=10, z=-15},
                            maxpos = {x=15, y=10, z=15},
                            minvel = {x=0, y=-10, z=0},
                            maxvel = {x=0, y=-15, z=0},
                            minacc = {x=0, y=0, z=0},
                            maxacc = {x=0, y=0, z=0},
                            minexptime = 1,
                            maxexptime = 2,
                            minsize = 0.1,
                            maxsize = 1,
                            collisiondetection = true,
                            object_collision = true,
                            collision_removal = true,
                            vertical = true,
                            texture = "weather_rain.png",
                        })

                        if not sound_playing[player_name] then
                            sound_playing[player_name] = minetest.sound_play("weather_rain", {
                                to_player = player:get_player_name(),
                                gain = 0.8,
                                loop = true,
                            })
                        end
                    end
                end
            elseif weather == "stormy" then
                if time < 5000 or time > 19200 then
                    -- Night time
                    player:set_sky({
                        type = "plain",
                        base_color = {a=255, r=5, g=5, b=10},
                        clouds = true,
                    })
                elseif time > 5000 and time < 5500 then
                    --Sunrise
                    local sky_color = (time / 5) - 990
                    player:set_sky({
                        type = "plain",
                        base_color = {a=255, r=sky_color, g=sky_color, b=sky_color*1.13},
                        clouds = true,
                    })
                elseif time > 5500 and time < 18700 then
                    --Day time
                    player:set_sky({
                        type = "plain",
                        base_color = {a=255, r=110, g=110, b=130},
                        clouds = true,
                    })
                elseif time > 18700 and time < 19200 then
                    --Sunset
                    local sky_color = (80000000 / time) - 4165
                    player:set_sky({
                        type = "plain",
                        base_color = {a=255, r=sky_color, g=sky_color, b=sky_color*1.13},
                        clouds = true,
                    })
                end

                player:set_sun({
                    visible = false,
                    sunrise_visible = false,
                })

                player:set_moon({
                    visible = false,
                })

                player:set_stars({
                    visible = false,
                })

                player:set_clouds({
                    density = 1,
                    color = {a=255, r=180, g=180, b=180},
                })

                if player_pos.y > -40 and under_cover(player_pos) then
                    if temperature < 35 then
                        minetest.add_particlespawner({
                            amount = 2000,
                            time = 1,
                            attached = player,
                            minpos = {x=-15, y=5, z=-15},
                            maxpos = {x=15, y=10, z=15},
                            minvel = {x=0, y=-10, z=0},
                            maxvel = {x=0, y=-15, z=0},
                            minacc = {x=0, y=0, z=0},
                            maxacc = {x=0, y=0, z=0},
                            minexptime = 3,
                            maxexptime = 5,
                            minsize = 0.1,
                            maxsize = 1,
                            collisiondetection = true,
                            object_collision = true,
                            collision_removal = true,
                            vertical = true,
                            texture = "weather_snow.png",
                        })

                        if sound_playing[player_name] ~= nil then
                            minetest.sound_stop(sound_playing[player_name])
                            sound_playing[player_name] = nil
                        end
                    else
                        if math.random(1, 100) == 42 then
                            local lightning_pos = {
                                x = player_pos.x + math.random(-100, 100),
                                y = player_pos.y + 25,
                                z = player_pos.z + math.random(-100, 100),
                            }

                            minetest.add_particle({
                                pos = lightning_pos,
                                velocity = {x=0, y=0, z=0},
                                acceleration = {x=0, y=0, z=0},
                                expirationtime = 0.2,
                                size = 1000,
                                vertical = true,
                                texture = "weather_lightning.png",
                                glow = 10
                            })

                            minetest.sound_play("weather_lightning", {
                                pos = lightning_pos,
                                gain = 1.0,
                                max_hear_distance = 150,
                            })
                        end

                        minetest.add_particlespawner({
                            amount = 1500,
                            time = 1,
                            attached = player,
                            minpos = {x=-15, y=10, z=-15},
                            maxpos = {x=15, y=10, z=15},
                            minvel = {x=0, y=-20, z=0},
                            maxvel = {x=0, y=-25, z=0},
                            minacc = {x=0, y=0, z=0},
                            maxacc = {x=0, y=0, z=0},
                            minexptime = 1,
                            maxexptime = 2,
                            minsize = 1,
                            maxsize = 2,
                            collisiondetection = true,
                            object_collision = true,
                            collision_removal = true,
                            vertical = true,
                            texture = "weather_rain.png",
                        })

                        if not sound_playing[player_name] then
                            sound_playing[player_name] = minetest.sound_play("weather_rain", {
                                to_player = player:get_player_name(),
                                gain = 1.0,
                                loop = true,
                            })
                        end
                    end
                end
            else
                player:set_sky({
                    base_color = {},
                    type = "regular",
                    clouds = true,
                })

                player:set_sun({
                    visible = true,
                    sunrise_visible = true,
                })

                player:set_moon({
                    visible = true,
                })

                player:set_stars({
                    visible = true,
                })

                player:set_clouds({
                    density = 0.4,
                    color = {a=255, r=240, g=240, b=229},
                })

                if sound_playing[player_name] ~= nil then
                    minetest.sound_stop(sound_playing[player_name])
                    sound_playing[player_name] = nil
                end
            end
        end
        weather_update_timer = 0
    end

    weather_update_timer = weather_update_timer + dtime
    weather_change_timer = weather_change_timer + dtime
end)
