farming.register_plant("farming:peas", {
	description = "Pea Seed",
	inventory_image = "farming_pea_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:peas_5", {
    drop = "farming:pea 30"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_peas",
	recipe = {"farming:peas"}
})

minetest.override_item("farming:peas", {
    groups = { sackable = 1 }
})

-- make pea eatable
minetest.override_item("farming:peas", {
    on_use = minetest.item_eat(0.5),
})
