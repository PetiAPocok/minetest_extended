farming.register_plant("farming:cocoa", {
	description = "Cocoa Seed",
	inventory_image = "farming_cocoa_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:cocoa_cake", {
	--~ description = "cocoa cake",
	--~ inventory_image = "farming_cocoa_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:cocoa_cake_dough", {
	--~ description = "cocoa cake dough",
	--~ inventory_image = "farming_cocoa_cake_dough.png",
--~ })

--~ cococa dark??
--~ coocoa block??

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_cocoa",
	recipe = {"farming:cocoa"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:cocoa_cake_dough",
	--~ recipe = {"farming:cocoa", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:cocoa_cake",
	--~ recipe = "farming:cocoa_cake_dough"
--~ })

-- Override drop
minetest.override_item("farming:cocoa_4", {
    drop = "farming:cocoa 1"
})
