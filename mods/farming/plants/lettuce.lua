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

-- make lettuce eatable
minetest.override_item("farming:lettuce", {
    on_use = minetest.item_eat(2),
})
