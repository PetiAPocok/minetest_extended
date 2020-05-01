farming.register_plant("farming:pea", {
	description = "Pea Seed",
	inventory_image = "farming_pea_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:pea_cake", {
	--~ description = "pea cake",
	--~ inventory_image = "farming_pea_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:pea_cake_dough", {
	--~ description = "pea cake dough",
	--~ inventory_image = "farming_pea_cake_dough.png",
--})

-- crafting

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:seed_pea",
	--~ recipe = {"farming:pea"}
--~ })

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:pea_cake_dough",
	--~ recipe = {"farming:pea", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:pea_cake",
	--~ recipe = "farming:pea_cake_dough"
--~ })

-- make pea eatable
minetest.override_item("farming:pea", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:pea_5", {
    drop = "farming:pea 30"
})
