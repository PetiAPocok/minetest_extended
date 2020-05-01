farming.register_plant("farming:cucumber", {
	description = "Cucumber Seed",
	inventory_image = "farming_cucumber_seed.png",
	steps = 4,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:cucumber_cake", {
	--~ description = "cucumber cake",
	--~ inventory_image = "farming_cucumber_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:cucumber_cake_dough", {
	--~ description = "cucumber cake dough",
	--~ inventory_image = "farming_cucumber_cake_dough.png",
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_cucumber 20",
	recipe = {"farming:cucumber"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:cucumber_cake_dough",
	--~ recipe = {"farming:cucumber", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:cucumber_cake",
	--~ recipe = "farming:cucumber_cake_dough"
--~ })

-- make cucumber eatable
minetest.override_item("farming:cucumber", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:cucumber_4", {
    drop = "farming:cucumber 5"
})
