farming.register_plant("farming:soybean", {
	description = "Soybean Seed",
	inventory_image = "farming_soybean_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:soybean_5", {
    drop = {
		items = {
			{ items = {"farming:soybean 20"} },
            { items = {"farming:seed_soybean 2"} }
		}
	}
})

minetest.registered_items["farming:soybean"].groups.sackable = 1

minetest.override_item("farming:soybean_5", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2},
        },
    },
})
