farming.register_plant("farming:carrot", {
	description = "Carrot Seed",
	inventory_image = "farming_carrot_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:carrot_4", {
    drop = "farming:carrot 5"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_carrot",
	recipe = {"farming:carrot"}
})

-- make carrot eatable
minetest.override_item("farming:carrot", {
    on_use = minetest.item_eat(2),
})

minetest.register_craftitem("farming:carrot_cake_dough", {
	description = "Carrot Cake Dough",
	inventory_image = "farming_carrot_cake_dough.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:carrot_cake_dough",
    recipe = {"farming:carrot", "farming:flour", "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
   replacements = {
       {"mobs:bucket_milk", "bucket:bucket_empty"}
   }
})

minetest.register_craftitem("farming:carrot_cake", {
    description = "Carrot Cake",
    inventory_image = "farming_carrot_cake.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:carrot_cake",
	recipe = "farming:carrot_cake_dough"
})
