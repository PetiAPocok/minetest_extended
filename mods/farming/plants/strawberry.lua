farming.register_plant("farming:strawberry", {
	description = "Strawberry Seeds",
	inventory_image = "farming_strawberry_seed.png",
	steps = 4,
	minlight = 11,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:strawberry_4", {
    drop = "farming:strawberry 6"
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:seed_strawberry",
    recipe = {"farming:strawberry"}
})

-- make strawberry eatable
minetest.override_item("farming:strawberry", {
    on_use = minetest.item_eat(1),
})


minetest.override_item("farming:strawberry_4", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 0.0, 0.4},
        },
    },
})
