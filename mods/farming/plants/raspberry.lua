farming.register_plant("farming:raspberry", {
	description = "Raspberry Seed",
	inventory_image = "farming_raspberry_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:raspberry_cake", {
	--~ description = "raspberry cake",
	--~ inventory_image = "farming_raspberry_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:raspberry_cake_dough", {
	--~ description = "raspberry cake dough",
	--~ inventory_image = "farming_raspberry_cake_dough.png",
--~ })

-- crafting

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:seed_raspberry",
	--~ recipe = {"farming:raspberry"}
--~ })

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:raspberry_cake_dough",
	--~ recipe = {"farming:raspberry", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:raspberry_cake",
	--~ recipe = "farming:raspberry_cake_dough"
--~ })

-- make raspberry eatable
minetest.override_item("farming:raspberry", {
    on_use = minetest.item_eat(2),
})

-- Override drop
minetest.override_item("farming:raspberry_4", {
    drop = "farming:raspberry 5"
})
