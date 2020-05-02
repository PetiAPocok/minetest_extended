farming.register_plant("farming:garlic", {
	description = "Garlic Seed",
	inventory_image = "farming_garlic_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:garlic_5", {
    drop = "farming:garlic 7"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_garlic",
	recipe = {"farming:garlic", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

-- make garlic eatable
minetest.override_item("farming:garlic", {
    on_use = minetest.item_eat(1),
})

minetest.register_craftitem("farming:garlic_bread", {
	description = "Garlic Bread",
	inventory_image = "farming_garlic_bread.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:garlic_bread 7",
	recipe = {"farming:garlic", "farming:bread"}
})
