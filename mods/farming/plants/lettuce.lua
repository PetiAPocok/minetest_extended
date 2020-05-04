farming.register_plant("farming:lettuce", {
	description = "Lettuce Seed",
	inventory_image = "farming_lettuce_seed.png",
	steps = 6,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:lettuce_6", {
    drop = "farming:lettuce"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_lettuce",
	recipe = {"farming:lettuce"}
})

-- make lettuce eatable
minetest.override_item("farming:lettuce", {
    on_use = minetest.item_eat(2),
})
