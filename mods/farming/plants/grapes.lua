farming.register_plant("farming:grapes", {
	description = "Grapes Seed",
	inventory_image = "farming_grapes_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

-- Change visual scale of the grape plants
for i = 1 , 8 do
	minetest.override_item("farming:grapes_"..i, {
		drawtype = "plantlike",
		visual_scale = 2,
	})
end

--~ minetest.register_craftitem("farming:grapes_cake", {
	--~ description = "grapes cake",
	--~ inventory_image = "farming_grapes_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:grapes_cake_dough", {
	--~ description = "grapes cake dough",
	--~ inventory_image = "farming_grapes_cake_dough.png",
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_grapes 5",
	recipe = {"farming:grapes"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:grapes_cake_dough",
	--~ recipe = {"farming:grapes", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:grapes_cake",
	--~ recipe = "farming:grapes_cake_dough"
--~ })

-- make grapes eatable
minetest.override_item("farming:grapes", {
    on_use = minetest.item_eat(3),
})

-- Override drop
minetest.override_item("farming:grapes_8", {
    drop = "farming:grapes 5"
})
