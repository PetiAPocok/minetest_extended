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
            local monsters_name = minetest.registered_items[reason.object:get_entity_name()].description

            message = player:get_player_name() .. " " .. S("were killed by") .. " " .. monsters_name .. "."
        elseif reason.type == "fall" then
            message = player:get_player_name() .. " " .. S("fell from too high") .. "."
        else
            message = player:get_player_name() .. " " .. S("died") .. "."
        end

        minetest.chat_send_all(message)
    end)
end
