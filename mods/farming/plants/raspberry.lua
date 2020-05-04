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
