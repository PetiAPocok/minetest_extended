farming.register_plant("farming:rice", {
	description = "Rice Seed",
	inventory_image = "farming_rice_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:rice_8", {
    drop = "farming:rice 30"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_rice",
	recipe = {"farming:rice"}
})
