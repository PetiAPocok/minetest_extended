farming.register_plant("farming:hemp", {
	description = "Hemp Seed",
	inventory_image = "farming_hemp_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:hemp_8", {
	drop = {
		items = {
			{ items = {"farming:seed_hemp 5"} },
            { items = {"farming:hemp 15"} }
		}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:string",
	recipe = {"farming:hemp 5"}
})

minetest.override_item("farming:hemp_8", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35},
        },
    },
})
