farming.register_plant("farming:beetroot", {
	description = "Beetroot Seed",
	inventory_image = "farming_beetroot_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:beetroot_5", {
    drop = "farming:beetroot 5"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_beetroot",
	recipe = {"farming:beetroot"}
})

-- make beetroot eatable
minetest.override_item("farming:beetroot", {
    on_use = minetest.item_eat(1),
})
