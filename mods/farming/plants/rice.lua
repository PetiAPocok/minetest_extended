farming.register_plant("farming:rice", {
	description = "Rice Seed",
	inventory_image = "farming_rice_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:rice_cake", {
	--~ description = "rice cake",
	--~ inventory_image = "farming_rice_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:rice_cake_dough", {
	--~ description = "rice cake dough",
	--~ inventory_image = "farming_rice_cake_dough.png",
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_rice",
	recipe = {"farming:rice"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:rice_cake_dough",
	--~ recipe = {"farming:rice", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:rice_cake",
	--~ recipe = "farming:rice_cake_dough"
--~ })

-- Override drop
minetest.override_item("farming:rice_8", {
    drop = "farming:rice 30"
})
