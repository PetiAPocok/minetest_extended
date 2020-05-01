farming.register_plant("farming:carrot", {
	description = "Carrot Seed",
	inventory_image = "farming_carrot_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

minetest.register_craftitem("farming:carrot_cake", {
	description = "Carrot Cake",
	inventory_image = "farming_carrot_cake.png",
	on_use = minetest.item_eat(20),
})

minetest.register_craftitem("farming:carrot_cake_dough", {
	description = "carrot cake dough",
	inventory_image = "farming_carrot_cake_dough.png",
})

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_carrot",
	recipe = {"farming:carrot"}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:carrot_cake_dough",
	recipe = {"farming:carrot", "farming:flour", "farming:sugar"}
})


minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:carrot_cake",
	recipe = "farming:carrot_cake_dough"
})

-- make carrot eatable
minetest.override_item("farming:carrot", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:carrot_4", {
    drop = "farming:carrot 5"
})
