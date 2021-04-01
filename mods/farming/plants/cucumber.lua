farming.register_plant("farming:cucumber", {
	description = "Cucumber Seed",
	inventory_image = "farming_cucumber_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:cucumber_4", {
    drop = "farming:cucumber 5"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_cucumber 20",
	recipe = {"farming:cucumber"}
})

-- make cucumber eatable
minetest.override_item("farming:cucumber", {
    on_use = minetest.item_eat(2),
})

minetest.override_item("farming:cucumber_4", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 0.2, 0.4},
        },
    },
})
