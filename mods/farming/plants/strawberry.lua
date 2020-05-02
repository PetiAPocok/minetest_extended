farming.register_plant("farming:strawberry", {
	description = "Strawberry Seeds",
	inventory_image = "farming_strawberry_seed.png",
	steps = 4,
	minlight = 11,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:strawberry_4", {
    drop = "farming:strawberry 6"
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:seed_strawberry",
    recipe = {"farming:strawberry"}
})

-- make strawberry eatable
minetest.override_item("farming:strawberry", {
    on_use = minetest.item_eat(1),
})

minetest.register_craftitem("farming:strawberry_cake_dough", {
    description = "Strawberry Cake Dough",
    inventory_image = "farming_strawberry_cake_dough.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:strawberry_cake_dough",
    recipe = {"farming:strawberry", "farming:strawberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:strawberry_cake", {
	description = "Strawberry Cake",
	inventory_image = "farming_strawberry_cake.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:strawberry_cake",
	recipe = "farming:strawberry_cake_dough"
})
