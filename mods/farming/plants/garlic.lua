farming.register_plant("farming:garlic", {
	description = "Garlic Seed",
	inventory_image = "farming_garlic_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:garlic_cake", {
	--~ description = "garlic cake",
	--~ inventory_image = "farming_garlic_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:garlic_cake_dough", {
	--~ description = "garlic cake dough",
	--~ inventory_image = "farming_garlic_cake_dough.png",
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_garlic",
	recipe = {"farming:garlic", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:garlic_cake_dough",
	--~ recipe = {"farming:garlic", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:garlic_cake",
	--~ recipe = "farming:garlic_cake_dough"
--~ })

-- make garlic eatable
minetest.override_item("farming:garlic", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:garlic_5", {
    drop = "farming:garlic 7"
})
