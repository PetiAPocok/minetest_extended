timers = {}
local effects = {}
local hud_pos = {}
hud_pos.x = tonumber(minetest.settings:get("effects_hud_x_position"))
hud_pos.y = tonumber(minetest.settings:get("effects_hud_y_position"))

effects.fireproof = {
    name = "Fireproof",
    color = "ff3300",
    apply = function(player)

    end,
    remove = function(player)

    end
}

effects.health_regeneration = {
    name = "Health Regeneration",
    color = "ff0084",
    apply = function(player)
        player:set_hp(player:get_hp() + 1)
    end,
    remove = function(player)

    end
}

effects.mana_regeneration = {
    name = "Mana Regeneration",
    color = "0034f9",
    apply = function(player)
        hbmana.setregen(player:get_player_name(), 10)
    end,
    remove = function(player)
        hbmana.setregen(player:get_player_name(), 1)
    end
}

effects.mobility = {
    name = "Mobility",
    color = "a9d248",
    apply = function(player)
        player:set_physics_override(4, 2, nil)
    end,
    remove = function(player)
        player:set_physics_override(1, 1, nil)
    end
}

effects.shine = {
    name = "Shine",
    color = "ffcc00",
    apply = function(player)
        local playername = player:get_player_name()

        if timers[playername]["shine"]["current_pos"] == nil or timers[playername]["shine"]["old_pos"] == nil then
            timers[playername]["shine"]["current_pos"] = {}
            timers[playername]["shine"]["old_pos"] = {}
        end

        timers[playername]["shine"]["current_pos"] = vector.round(player:get_pos())

        local current_pos = timers[playername]["shine"]["current_pos"]
        local old_pos = timers[playername]["shine"]["old_pos"]


        current_pos["y"] = current_pos["y"] + 2

        if old_pos["x"] ~= current_pos["x"] or
        old_pos["y"] ~= current_pos["y"] or
        old_pos["z"] ~= current_pos["z"] then

            if old_pos["y"] ~= nil  then
                old_pos["y"] = old_pos["y"] - 1 -- For some reason the placed block "placing position" and "removing position" isn't the same...
                minetest.remove_node(old_pos)
                old_pos["y"] = old_pos["y"] + 1
            end
            minetest.place_node(current_pos, {name="walking_light:light"})
            timers[playername]["shine"]["old_pos"] = current_pos
        end
    end,
    remove = function(player)
        minetest.log("timers table: " .. dump(timers))
        local old_pos = timers[player:get_player_name()]["shine"]["old_pos"]

        old_pos["y"] = old_pos["y"] - 1 -- For some reason the placed block "placing position" and "removing position" isn't the same...
        minetest.remove_node(old_pos)
    end
}

effects.poison = {
    name = "Poison",
    color = "007502",
    apply = function(player)
        player:set_hp(player:get_hp() - 1)
    end,
    remove = function(player)

    end
}

effects.protection = {
    name = "Protection",
    color = "490e2e",
    apply = function(player)

    end,
    remove = function(player)

    end
}

effects.purity = {
    name = "Purity",
    color = "eeeeee",
    apply = function(player)
        for k,v in pairs(timers[player:get_player_name()]) do
            if k ~= "purity" then
                player:hud_remove(v["hud_bg_id"])
                player:hud_remove(v["hud_bar_id"])
                player:hud_remove(v["hud_text_id"])
                effects[k].remove(player)
                timers[player:get_player_name()][k] = null
            end
        end
    end,
    remove = function(player)

    end
}

effects.strength = {
    name = "Strength",
    color = "9927ff",
    apply = function(player)

    end,
    remove = function(player)

    end
}

effects.water_breathing = {
    name = "Water Breathing",
    color = "5483ff",
    apply = function(player)
        player:set_breath(player:get_breath() + 1)
    end,
    remove = function(player)

    end
}

minetest.register_on_joinplayer(
    function(player)
        timers[player:get_player_name()] = {}
    end
)

minetest.register_on_leaveplayer(
    function(player)
        timers[player:get_player_name()] = nil
    end
)

function add_effect(playername, effect, duration)
    local player = minetest.get_player_by_name(playername)
    duration = tonumber(duration)

    if not player then
        minetest.log(error, "effects_hud: Player not found!")
    elseif not effects[effect] then
        minetest.log(error, "effects_hud: Invalid effect!")
    elseif not tonumber(duration) then
        minetest.log(error, "effects_hud: Invalid duration!")
    else
        local players_effects = 0
        for k,v in pairs(timers[playername]) do
            players_effects = players_effects + 1
        end


        if not timers[playername][effect] then
            timers[playername][effect] = {}
            timers[playername][effect]["duration"] = duration
            timers[playername][effect]["initial_duration"] = duration

            local bg_id =
                player:hud_add({
                    hud_elem_type = "statbar",
                    position = hud_pos,
                    size = nil, -- intentionally set to nil
                    text = "effects_hud_bar_background.png",
                    number = 2,
                    alignment = {x = 0, y = 0},
                    offset = {x = 0, y = players_effects * 20}
                })

            local bar_id =
                player:hud_add({
                    hud_elem_type = "statbar",
                    position = hud_pos,
                    size = nil, -- intentionally set to nil
                    text = "effects_hud_bar.png^[colorize:#" .. (effects[effect].color or "fffff"),
                    number = 160,
                    alignment = {x = 1, y = 1},
                    offset = {x = 1, y = players_effects * 20 + 1}
                })

            local text_id =
                player:hud_add({
                    hud_elem_type = "text",
                    position = hud_pos,
                    size = nil, -- intentionally set to nil
                    text = effects[effect].name .. ": " .. duration,
                    number = 0xFFFFFF,
                    alignment = {x = 1, y = 1},
                    offset = {x = 2, y = players_effects * 20}
                })

            timers[playername][effect]["hud_bg_id"] = bg_id
            timers[playername][effect]["hud_bar_id"] = bar_id
            timers[playername][effect]["hud_text_id"] = text_id
        else
            timers[playername][effect]["duration"] = duration
            timers[playername][effect]["initial_duration"] = duration
        end
    end
end

minetest.register_chatcommand("effect", {
    params = "<player> <effect> <duration>",
    description = "Adds <effect> to <player> for <duration> seconds.\nAvailable effects: "..
    "fireproof, health_regeneration, mana_regeneration, mobility, night_vision, poison, protection, strength, water_breathing.",
    privs = {
        creative = true,
    },
    func = function(name, param)
        local parameters = param:split(" ")

        if parameters[3] ~= nil and parameters[2] ~= nil and parameters[1] ~= nil then
            if not minetest.get_player_by_name(parameters[1]) then
                return false, "Player not found!"
            end

            if not effects[parameters[2]] then
                return false, "Invalid effect!"
            end

            if not tonumber(parameters[3]) then
                return false, "Invalid duration!"
            end

            add_effect(parameters[1], parameters[2], parameters[3])

            return true, "Effect applied!"
        else
            return false, "Missing parameters!"
        end
    end,
})

local time_count = 0
minetest.register_globalstep(
    function(dtime)
        time_count = time_count + dtime
        if time_count > 0.5 then
            for username,effect_table in pairs(timers) do
                local player = minetest.get_player_by_name(username)
                for effect,effect_parameters in pairs(effect_table) do
                    if effect_parameters["duration"] > 0 then
                        effect_parameters["duration"] = effect_parameters["duration"] - 0.5

                        player:hud_change(effect_parameters["hud_bar_id"], "number", 160 / effect_parameters["initial_duration"] * effect_parameters["duration"])
                        player:hud_change(effect_parameters["hud_text_id"], "text", effects[effect].name .. ": " .. effect_parameters["duration"])
                        effects[effect].apply(player)
                    else
                        player:hud_remove(effect_parameters["hud_bg_id"])
                        player:hud_remove(effect_parameters["hud_bar_id"])
                        player:hud_remove(effect_parameters["hud_text_id"])
                        effects[effect].remove(player)
                        timers[username][effect] = nil
                    end
                end
            end
            time_count = 0
        end
    end
)

minetest.register_chatcommand("effects", {
    privs = {
        interact = true,
    },
    func = function(name, param)

        return true, "timers" .. dump(timers)
    end,
})
