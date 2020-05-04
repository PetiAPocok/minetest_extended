farming.register_plant("farming:peanut", {
	description = "Peanut Seed",
	inventory_image = "farming_peanut_seed.png",
	steps = 6,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:peanut_6", {
    drop = "farming:peanut"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_peanut",
	recipe = {"farming:peanut"}
})

-- make peanut eatable
minetest.override_item("farming:peanut", {
    on_use = minetest.item_eat(0.5),
})
