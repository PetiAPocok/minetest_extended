walking_light = {}
local players = {}
local timer = 0

minetest.register_node("walking_light:light", {
    drawtype = "glasslike",
    tiles = {"walking_light.png"},
    -- tiles = {"walking_light_debug.png"},
    paramtype = "light",
    walkable = false,
    is_ground_content = true,
    sunlight_propagates = true,
    light_source = 13,
    groups = {not_in_creative_inventory = 1},
    pointable = false,
    physical = false,
})

minetest.register_on_joinplayer(function(player)
    players[player:get_player_name()] = {}
    players[player:get_player_name()]["old_pos"] = {}
    players[player:get_player_name()]["current_pos"] = {}
end)

minetest.register_on_leaveplayer(function(player)
    walking_light.remove_light(player:get_pos())
    players[player:get_player_name()] = nil
end)

minetest.register_on_dieplayer(function(player, reason)
    walking_light.remove_light(player:get_pos())
end)

minetest.register_on_shutdown(function()
    for k,v in pairs(players) do
        if v["current_pos"]["y"] ~= nil then
            walking_light.remove_light(v["current_pos"])
        end

        if v["old_pos"]["y"] ~= nil then
            walking_light.remove_light(v["old_pos"])
        end
    end
end)

minetest.register_globalstep(function(dtime)
    if timer > 0.2 then
        for k,v in pairs(players) do
            if minetest.get_player_by_name(k):get_wielded_item():get_definition().name == "default:torch" then
                v["current_pos"] = vector.round(minetest.get_player_by_name(k):get_pos())
                v["current_pos"]["y"] = v["current_pos"]["y"] + 1

                if v["old_pos"]["x"] ~= v["current_pos"]["x"] or v["old_pos"]["y"] ~= v["current_pos"]["y"] or v["old_pos"]["z"] ~= v["current_pos"]["z"] then
                    local new_pos = {}

                    if minetest.get_node(v["current_pos"]).name == "air" then
                        v["current_pos"]["y"] = v["current_pos"]["y"] + 1
                        minetest.place_node(v["current_pos"], {name="walking_light:light"})
                        v["current_pos"]["y"] = v["current_pos"]["y"] - 1
                        new_pos = v["current_pos"]
                    end

                    if v["old_pos"]["y"] ~= nil then
                        walking_light.remove_light(v["old_pos"])
                    end

                    v["old_pos"] = new_pos
                end
            else
                if v["old_pos"]["y"] ~= nil then
                    walking_light.remove_light(v["old_pos"])
                end
                v["current_pos"] = {}
                v["old_pos"] = {}
            end
        end
        timer = 0
    end
    timer = timer + dtime
end)

walking_light.remove_light = function(pos)
    local done = false

    if minetest.get_node(pos).name == "walking_light:light" then
        minetest.remove_node(pos)
        done = true
    end

    pos.y = pos.y - 1

    if not done and minetest.get_node(pos).name == "walking_light:light" then
        minetest.remove_node(pos)
    end
end
