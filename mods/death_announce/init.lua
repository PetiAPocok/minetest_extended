-- support for MT game translation.
local S = default.get_translator

local enabled = true

if minetest.settings:get("death_announce") == "false" then
    enabled = false
end

if enabled then
    minetest.register_on_dieplayer(function(player, reason)
        local message = ""

        if reason.type == "punch" and reason.object:is_player() then
            message = player:get_player_name() .. " " .. S("were killed by") .. " " .. reason.object:get_player_name() .. "."
        elseif reason.type == "punch" then
            local hiters_name = reason.object:get_entity_name()
            local monsters_egg = minetest.registered_items[hiters_name]

            if monsters_egg ~= nil then
                message = player:get_player_name() .. " " .. S("were killed by") .. " " .. monsters_egg.description .. "."
            else
                local projectiles_name = string.gsub (string.sub(hiters_name, string.find(hiters_name, ":") + 1, string.len(hiters_name)), "_", " ")
                message = player:get_player_name() .. " " .. S("were killed by") .. " " .. projectiles_name .. "."
            end

        elseif reason.type == "fall" then
            message = player:get_player_name() .. " " .. S("fell from too high") .. "."
        else
            message = player:get_player_name() .. " " .. S("died") .. "."
        end

        minetest.chat_send_all(message)
    end)
end
