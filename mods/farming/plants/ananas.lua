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

--~ minetest.register_craftitem("farming:ananas_cake", {
	--~ description = "ananas cake",
	--~ inventory_image = "farming_ananas_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:ananas_cake_dough", {
	--~ description = "ananas cake dough",
	--~ inventory_image = "farming_ananas_cake_dough.png",
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_ananas",
	recipe = {"farming:ananas"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:ananas_cake_dough",
	--~ recipe = {"farming:ananas", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:ananas_cake",
	--~ recipe = "farming:ananas_cake_dough"
--~ })

-- make ananas eatable
minetest.override_item("farming:ananas", {
    on_use = minetest.item_eat(7),
})

-- Override drop
minetest.override_item("farming:ananas_8", {
    drop = "farming:ananas"
})
