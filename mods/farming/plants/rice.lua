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

minetest.registered_items["farming:rice"].groups.sackable = 1

minetest.override_item("farming:rice_8", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
        },
    },
})
