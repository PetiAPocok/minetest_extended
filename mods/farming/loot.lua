-- Register farming items as dungeon loot
if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register({
		{name = "farming:string", chance = 0.5, count = {1, 8}},
		{name = "farming:wheat", chance = 0.5, count = {2, 5}},
		{name = "farming:seed_cotton", chance = 0.4, count = {1, 4},
            types = {"normal"}},

        {name = "farming:seed_ananas", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_bean", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_beetroot", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_blueberry", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_carrot", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_cocoa", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_corn", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_cucumber", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_garlic", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_grape", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_hemp", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_lettuce", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_onion", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_peas", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_potato", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_raspberry", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_rice", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_soybean", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_strawberry", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_tomato", chance = 0.4, count = {1, 4}}
	})
end

-- Register seeds
-- seeds from dirt
table.insert(minetest.registered_items["default:dirt_with_grass"].drop.items, { rarity = 20, items = {"farming:potato"} })
table.insert(minetest.registered_items["default:dirt_with_grass"].drop.items, { rarity = 20, items = {"farming:peanut"} })

--seeds from grass
for i=1,5 do
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_blueberry"} })
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_carrot"} })
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_cucumber"} })
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_lettuce"} })
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_strawberry"} })
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_soybean"} })
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_tomato"} })
    table.insert(minetest.registered_items["default:grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_wheat"} })
end

-- Grows in the savanna (dry dirt, acatia tree)
for i=1,5 do
    table.insert(minetest.registered_items["default:dry_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_corn"} })
    table.insert(minetest.registered_items["default:dry_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_potato"} })
    table.insert(minetest.registered_items["default:dry_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_garlic"} })
    table.insert(minetest.registered_items["default:dry_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_onion"} })
    table.insert(minetest.registered_items["default:dry_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_rice"} })
end

-- Grows in jungle
table.insert(minetest.registered_items["default:junglegrass"].drop.items, { rarity = 20, items = {"farming:seed_ananas"} })
table.insert(minetest.registered_items["default:junglegrass"].drop.items, { rarity = 20, items = {"farming:seed_cotton"} })
table.insert(minetest.registered_items["default:junglegrass"].drop.items, { rarity = 20, items = {"farming:seed_cocoa"} })
table.insert(minetest.registered_items["default:junglegrass"].drop.items, { rarity = 20, items = {"farming:seed_rice"} })

 -- Grows on sand (anywhere)
for i=1,3 do
    table.insert(minetest.registered_items["default:marram_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_bean"} })
    table.insert(minetest.registered_items["default:marram_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_hemp"} })
    table.insert(minetest.registered_items["default:marram_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_huckleberry"} })
    table.insert(minetest.registered_items["default:marram_grass_" .. i].drop.items, { rarity = 20, items = {"farming:seed_grape"} })
end

-- Grows in warm pine forests
for i=1,3 do
    table.insert(minetest.registered_items["default:fern_" .. i].drop.items, { rarity = 20, items = {"farming:seed_beetroot"} })
    table.insert(minetest.registered_items["default:fern_" .. i].drop.items, { rarity = 20, items = {"farming:seed_peas"} })
    table.insert(minetest.registered_items["default:fern_" .. i].drop.items, { rarity = 20, items = {"farming:seed_raspberry"} })
end
