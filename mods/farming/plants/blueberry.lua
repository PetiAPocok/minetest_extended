farming.register_plant("farming:blueberry", {
	description = "Blueberry Seed",
	inventory_image = "farming_blueberry_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:blueberry_4", {
    drop = "farming:blueberry 15"
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:seed_blueberry",
    recipe = {"farming:blueberry"}
})

-- make blueberry eatable
minetest.override_item("farming:blueberry", {
    on_use = minetest.item_eat(1),
})

minetest.override_item("farming:blueberry_4", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 0.2, 0.4},
        },
    },
})
