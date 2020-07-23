farming.register_plant("farming:onion", {
	description = "Onion Seed",
	inventory_image = "farming_onion_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:onion_5", {
    drop = {
        items = {
            { items = {"farming:seed_onion"} },
            { items = {"farming:onion"} }
        }
    }
})

-- make onion eatable
minetest.override_item("farming:onion", {
    on_use = minetest.item_eat(2),
})
