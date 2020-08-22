-- Fish?
minetest.register_craftitem("fishing:tuna", {
	description = "Tuna",
	inventory_image = "fishing_tuna.png",
    wield_scale = { x = 2, y = 2, z = 1 },
    groups = { fishing_catch = 1, fish_raw = 1 },
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("fishing:tuna_cooked", {
	description = "Cooked Tuna",
	inventory_image = "fishing_tuna_cooked.png",
    groups = { fish_cooked = 1 },
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
    groups = { fishing_catch = 1, fish_raw = 1 },
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("fishing:salmon_cooked", {
	description = "Cooked Salmon",
	inventory_image = "fishing_salmon_cooked.png",
    groups = { fish_cooked = 1 },
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
    groups = { fishing_catch = 1, fish_raw = 1 }
})


-- Shusi
minetest.register_craftitem("fishing:shusi", {
	description = "Shusi",
	inventory_image = "fishing_sushi.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
    type = "shapeless",
    output = "fishing:shusi",
    recipe = {"default:sand_with_kelp", "farming:rice_cooked", "group:fish_raw"},
	replacements = {
		{"farming:rice_cooked", "farming:bowl"}
	}
})
