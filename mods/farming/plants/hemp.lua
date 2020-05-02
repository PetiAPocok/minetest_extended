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
			{ items = {"farming:seed_hemp"} },
            { items = {"farming:hemp 5"} }
		}
	}
})
