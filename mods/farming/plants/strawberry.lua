farming.register_plant("farming:strawberry", {
	description = "Strawberry Seeds",
	inventory_image = "farming_strawberry_seed.png",
	steps = 4,
	minlight = 11,
	fertility = {"grassland"},
})

minetest.register_craftitem("farming:strawberry_pie", {
	description = "Strawberry Pie",
	inventory_image = "farming_strawberry_pie.png",
	on_use = minetest.item_eat(20),
})

minetest.register_craftitem("farming:strawberry_pie_dough", {
	description = "Strawberry Pie Dough",
	inventory_image = "farming_strawberry_pie_dough.png",
})

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_strawberry",
	recipe = {"farming:strawberry"}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:strawberry_pie_dough",
	recipe = {"farming:strawberry", "farming:flour", "farming:sugar"}
})


minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:strawberry_pie",
	recipe = "farming:strawberry_pie_dough"
})

-- make strawberry eatable
minetest.override_item("farming:strawberry", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:strawberry_4", {
    drop = "farming:strawberry 2"
})


