farming.register_plant("farming:chili", {
	description = "Chili Seed",
	inventory_image = "farming_chili_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:chili_bowl", {
	--~ description = "chili cake",
	--~ inventory_image = "farming_chili_bowl.png",
	--~ on_use = minetest.item_eat(10),
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_chili 20",
	recipe = {"farming:chili"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:chili_cake_dough",
	--~ recipe = {"farming:chili", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:chili_cake",
	--~ recipe = "farming:chili_cake_dough"
--~ })

-- make chili eatable
minetest.override_item("farming:chili", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:chili_8", {
    drop = "farming:chili 7"
})
