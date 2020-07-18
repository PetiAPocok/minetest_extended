local mod_storage = minetest.get_mod_storage()

health_adjuster = {}
health_adjuster.players = {}

local start_max_health = tonumber(minetest.settings:get("health_adjuster_start_max_health")) or 20
local max_reachable = tonumber(minetest.settings:get("health_adjuster_max_reachable")) or 50

-- Load palyers' saved data
if mod_storage:get_string("data") ~= nil and mod_storage:get_string("data") ~= "return nil" and mod_storage:get_string("data") ~= "" then
    health_adjuster.players = minetest.deserialize(mod_storage:get_string("data"))
    minetest.log("info", "health_adjuster: Previously saved data loaded.")
end

local function save_players_data()
    mod_storage:set_string("data", minetest.serialize(health_adjuster.players))
end

health_adjuster.set_players_max_health = function(player, value)
    local name = player:get_player_name()

    if value > 0 then
        if value > max_reachable then
            value = max_reachable
        end

        health_adjuster.players[name] = value

        player:set_properties({
            hp_max = value,
        })

        save_players_data()
    end
end

minetest.register_on_joinplayer(function(player)
    local name = player:get_player_name()

    if health_adjuster.players[name] == nil then
        health_adjuster.players[name] = start_max_health
        save_players_data()
    else
        player:set_properties({
            hp_max = health_adjuster.players[name]
        })
    end
end)
