-- Fish?
minetest.register_craftitem("fishing:tuna", {
	description = "Tuna",
	inventory_image = "fishing_tuna.png",
    wield_scale = { x = 2, y = 2, z = 1 },
	on_use = minetest.item_eat(2),
	groups = { fishing_catch = 1 }
})

minetest.register_craftitem("fishing:tuna_cooked", {
	description = "Cooked Tuna",
	inventory_image = "fishing_tuna_cooked.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	output = "fishing:tuna_cooked",
	recipe = "fishing:tuna",
	cooktime = 10,
})

-- Salmon
minetest.register_craftitem("fishing:salmon", {
	description = "Salmon",
	inventory_image = "fishing_salmon.png",
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
	recipe = "fishing:salmon",
	cooktime = 10,
})

-- Clownfish
minetest.register_craftitem("fishing:clownfish", {
	description = "Clownfish",
	inventory_image = "fishing_clownfish.png",
	on_use = minetest.item_eat(1),
    groups = { fishing_catch = 1 }
})
