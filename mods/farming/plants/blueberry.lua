farming.register_plant("farming:blueberry", {
	description = "Blueberry Seed",
	inventory_image = "farming_blueberry_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:blueberry_cake", {
	--~ description = "blueberry cake",
	--~ inventory_image = "farming_blueberry_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:blueberry_cake_dough", {
	--~ description = "blueberry cake dough",
	--~ inventory_image = "farming_blueberry_cake_dough.png",
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_blueberry",
	recipe = {"farming:blueberry"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:blueberry_cake_dough",
	--~ recipe = {"farming:blueberry", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:blueberry_cake",
	--~ recipe = "farming:blueberry_cake_dough"
--~ })

-- make blueberry eatable
minetest.override_item("farming:blueberry", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:blueberry_4", {
    drop = "farming:blueberry 25"
})
