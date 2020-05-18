minetest.register_craftitem("fishing:worm", {
	description = "Worm",
    inventory_image = "fishing_worm.png",
    groups = { fishing_bait = 1 },
})

-- Add worm drop to dirt drops
expanded_drop = minetest.registered_items["default:dirt"].drop.items
table.insert(expanded_drop, { rarity = 30, items = {"fishing:worm"} })
minetest.override_item("farming:corn", {
    drop = expanded_drop
})

-- Make corn useable as fishing bait
local expanded_groups = minetest.registered_items["farming:seed_corn"].groups
expanded_groups["fishing_bait"] = 1
minetest.override_item("farming:seed_corn", {
	groups = expanded_groups
})
