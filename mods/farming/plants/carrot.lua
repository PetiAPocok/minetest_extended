farming.register_plant("farming:carrot", {
	description = "Carrot Seed",
	inventory_image = "farming_carrot_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:carrot_4", {
    drop = "farming:carrot 5"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_carrot",
	recipe = {"farming:carrot"}
})

-- make carrot eatable
minetest.override_item("farming:carrot", {
    on_use = minetest.item_eat(2),
})

minetest.override_item("farming:carrot_4", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.35, -0.5, -0.35, 0.35, 0.25, 0.35},
        },
    },
})
