farming.register_plant("farming:ananas", {
	description = "Ananas Seed",
	inventory_image = "farming_ananas_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

-- Change visual scale of the ananas plants
for i = 1 , 8 do
	minetest.override_item("farming:ananas_"..i, {
		drawtype = "plantlike",
		visual_scale = 1.5 ,
	})
end

-- Override drop
minetest.override_item("farming:ananas_8", {
    drop = "farming:ananas"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_ananas 10",
	recipe = {"farming:ananas"}
})

-- make ananas eatable
minetest.override_item("farming:ananas", {
    on_use = minetest.item_eat(7),
})
