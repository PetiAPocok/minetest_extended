farming.register_plant("farming:onion", {
	description = "Onion Seed",
	inventory_image = "farming_onion_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:onion_cake", {
	--~ description = "onion cake",
	--~ inventory_image = "farming_onion_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:onion_cake_dough", {
	--~ description = "onion cake dough",
	--~ inventory_image = "farming_onion_cake_dough.png",
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_onion",
	recipe = {"farming:onion"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:onion_cake_dough",
	--~ recipe = {"farming:onion", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:onion_cake",
	--~ recipe = "farming:onion_cake_dough"
--~ })

-- make onion eatable
minetest.override_item("farming:onion", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:onion_5", {
    drop = "farming:onion 1"
})
