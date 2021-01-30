farming.register_plant("farming:garlic", {
	description = "Garlic Seed",
	inventory_image = "farming_garlic_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:garlic_5", {
    drop = "farming:garlic 7"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_garlic 5",
	recipe = {"farming:garlic", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

-- make garlic eatable
minetest.override_item("farming:garlic", {
    on_use = minetest.item_eat(1),
})

minetest.override_item("farming:garlic_5", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
        },
    },
})
