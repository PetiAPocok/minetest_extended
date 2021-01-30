farming.register_plant("farming:lettuce", {
	description = "Lettuce Seed",
	inventory_image = "farming_lettuce_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:lettuce_4", {
    drop = {
        items = {
            { items = {"farming:seed_lettuce"} },
            { items = {"farming:lettuce"} }
        }
    }
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_lettuce",
	recipe = {"farming:lettuce", "bucket:bucket_water"},
    replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

-- make lettuce eatable
minetest.override_item("farming:lettuce", {
    on_use = minetest.item_eat(2),
})

minetest.override_item("farming:lettuce_4", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 0.2, 0.4},
        },
    },
})
