farming.register_plant("farming:blueberry", {
	description = "Blueberry Seed",
	inventory_image = "farming_blueberry_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:blueberry_4", {
    drop = "farming:blueberry 25"
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:seed_blueberry",
    recipe = {"farming:blueberry"}
})

-- make blueberry eatable
minetest.override_item("farming:blueberry", {
    on_use = minetest.item_eat(1),
})

minetest.register_craftitem("farming:blueberry_pie_dough", {
	description = "Blueberry Pie Dough",
	inventory_image = "farming_blueberry_pie_dough.png",
 })

minetest.register_craft({
    type = "shapeless",
    output = "farming:blueberry_pie_dough",
    recipe = {"farming:blueberry", "farming:blueberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

 minetest.register_craftitem("farming:blueberry_pie", {
    description = "Blueberry Pie",
    inventory_image = "farming_blueberry_pie.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:blueberry_pie",
	recipe = "farming:blueberry_pie_dough"
})
