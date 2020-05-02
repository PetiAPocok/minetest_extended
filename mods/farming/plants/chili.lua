farming.register_plant("farming:chili", {
	description = "Chili Seed",
	inventory_image = "farming_chili_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:chili_8", {
    drop = "farming:chili 7"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_chili 20",
	recipe = {"farming:chili"}
})

-- make chili eatable
minetest.override_item("farming:chili", {
    on_use = minetest.item_eat(1),
})
