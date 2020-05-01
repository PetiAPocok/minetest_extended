farming.register_plant("farming:potato", {
	description = "Potato Seed",
	inventory_image = "farming_potato_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

minetest.register_craftitem("farming:potato_baked", {
	description = "Baked Potato",
	inventory_image = "farming_potato_baked.png",
	on_use = minetest.item_eat(3),
})

-- crafting

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:baked_potato",
	recipe = "farming:potato"
})

-- make potato eatable
minetest.override_item("farming:potato", {
    on_use = minetest.item_eat(1),
    
})

-- Override drop
minetest.override_item("farming:potato_5", {
	drop = {
		--max_items = 1,
		items = {
			{
				items = {"farming:potato_seed"},
			},
			{
				items = {"farming:potato 5"}
			}
		}
	}
})
