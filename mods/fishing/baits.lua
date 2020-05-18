minetest.register_craftitem("fishing:worm", {
	description = "Worm",
    inventory_image = "fishing_worm.png",
    groups = { fishing_bait = 1 },
})

-- expanded_groups = minetest.registered_items["farming:corn"].groups
-- expanded_groups["fishing_bait"] = 1
-- { items = {'farming:peanut'}, rarity = 20 }
-- minetest.override_item("farming:corn", {
-- 	groups = expanded_groups
-- })


-- Make corn useable as fishing bait
local expanded_groups = minetest.registered_items["farming:seed_corn"].groups
expanded_groups["fishing_bait"] = 1
minetest.override_item("farming:seed_corn", {
	groups = expanded_groups
})
