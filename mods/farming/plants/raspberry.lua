farming.register_plant("farming:raspberry", {
	description = "Raspberry Seed",
	inventory_image = "farming_raspberry_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:raspberry_4", {
    drop = "farming:raspberry 5"
})

minetest.register_craft({
    type = "shapeless",
	output = "farming:seed_raspberry",
	recipe = {"farming:raspberry"}
})

-- make raspberry eatable
minetest.override_item("farming:raspberry", {
    on_use = minetest.item_eat(1),
})

minetest.register_craftitem("farming:raspberry_pie_dough", {
    description = "Raspberry Pie Dough",
    inventory_image = "farming_raspberry_pie_dough.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:raspberry_pie_dough",
    recipe = {"farming:raspberry", "farming:raspberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:raspberry_pie", {
	description = "Raspberry Pie",
	inventory_image = "farming_raspberry_pie.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:raspberry_pie",
	recipe = "farming:raspberry_pie_dough"
})
