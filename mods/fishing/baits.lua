minetest.register_craftitem("fishing:worm", {
	description = "Worm",
    inventory_image = "fishing_worm.png",
    groups = { fishing_bait = 1 },
})

-- Add worm drop to dirt drops
table.insert(minetest.registered_items["default:dirt"].drop.items, { rarity = 30, items = {"fishing:worm"} })

-- Make corn useable as fishing bait
local expanded_groups = minetest.registered_items["farming:seed_corn"].groups
expanded_groups["fishing_bait"] = 1
minetest.override_item("farming:seed_corn", {
	groups = expanded_groups
})
