farming.register_plant("farming:tomato", {
	description = "Tomato Seed",
	inventory_image = "farming_tomato_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:tomato_8", {
    drop = "farming:tomato 5"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_tomato",
	recipe = {"farming:tomato"}
})

-- make carrot eatable
minetest.override_item("farming:tomato", {
    on_use = minetest.item_eat(1),
})

minetest.override_item("farming:tomato_8", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35},
        },
    },
})
