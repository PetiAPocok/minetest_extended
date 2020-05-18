-- Fish?
minetest.register_craftitem("fishing:fish_raw", {
	description = "Raw Fish",
	inventory_image = "fishing_fish_raw.png",
	on_use = minetest.item_eat(2),
	groups = { fishing_catch = 1 }
})

minetest.register_craftitem("fishing:fish_cooked", {
	description = "Cooked Fish",
	inventory_image = "fishing_fish_cooked.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	output = "fishing:fish_cooked",
	recipe = "fishing:fish_raw",
	cooktime = 10,
})

-- Salmon
minetest.register_craftitem("fishing:salmon_raw", {
	description = "Raw Salmon",
	inventory_image = "fishing_salmon_raw.png",
	on_use = minetest.item_eat(2),
    groups = { fishing_catch = 1 }
})

minetest.register_craftitem("fishing:salmon_cooked", {
	description = "Cooked Salmon",
	inventory_image = "fishing_salmon_cooked.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	output = "fishing:salmon_cooked",
	recipe = "fishing:salmon_raw",
	cooktime = 10,
})

-- Clownfish
minetest.register_craftitem("fishing:clownfish_raw", {
	description = "Clownfish",
	inventory_image = "fishing_clownfish_raw.png",
	on_use = minetest.item_eat(1),
    groups = { fishing_catch = 1 }
})
