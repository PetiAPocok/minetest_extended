-- support for MT game translation.
local S = default.get_translator

local items_list = minetest.registered_items

for id in pairs(items_list) do
    local item_description = items_list[id].description

    -- Weapons
    if string.find(id, "sword") or string.find(id, "axe") or string.find(id, "pick") or string.find(id, "shovel") then
        local item_damage = items_list[id].tool_capabilities.damage_groups.fleshy

        minetest.override_item(id, {
            description = items_list[id].description .. "\n" .. S("Damage") .. ": " .. item_damage
        })
--     elseif string.find(id, "armor") then -- Nem jöttem rá hogy működnek az armor-ok...
--         local item_defense = items_list[id].tool_capabilities.damage_groups.fleshy
--
--         minetest.override_item(id, {
--             description = items_list[id].description .. "\n" .. S("Defense") .. ": " .. item_defense
--         })
     end
end
