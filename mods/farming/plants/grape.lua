farming.register_plant("farming:grape", {
	description = "Grape Seed",
	inventory_image = "farming_grape_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

-- Change visual scale of the grape plants
for i = 1 , 8 do
	minetest.override_item("farming:grape_"..i, {
		drawtype = "plantlike",
		visual_scale = 2,
	})
end

-- Override drop
minetest.override_item("farming:grape_8", {
    drop = "farming:grape 5"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_grape 5",
	recipe = {"farming:grapes"}
})

-- make grapes eatable
minetest.override_item("farming:grape", {
    on_use = minetest.item_eat(3),
})
