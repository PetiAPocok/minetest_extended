farming.register_plant("farming:corn", {
	description = "Corn Seeds",
	inventory_image = "farming_corn_seed.png",
	steps = 8,
	minlight = 12,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
})

minetest.register_craftitem("farming:corn_bread", {
	description = "Corn Bread",
	inventory_image = "farming_corn_bread.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem("farming:corn_bread_dough", {
	description = "Corn Bread Dough",
	inventory_image = "farming_corn_bread_dough.png",
})

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_corn",
	recipe = {"farming:corn"}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:corn_bread_dough",
	recipe = {"farming:corn", "farming:flour", "farming:salt"}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:corn_bread_dough",
	recipe = {"farming:seed_corn", "farming:flour", "farming:salt"}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:corn_bread",
	recipe = "farming:corn_bread_dough"
})

minetest.register_craftitem("farming:corn_boiled", {
	description = "Boiled Corn",
	inventory_image = "farming_corn_boiled.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 14,
	output = "farming:corn_baken",
	recipe = "farming:corn"
})

-- Change visual scale of the corn plants
for i = 1 , 8 do
	minetest.override_item("farming:corn_"..i, {
		drawtype = "plantlike",
		visual_scale = 1.5 ,
	})
end

-- Override drop
minetest.override_item("farming:corn_8", {
	drawtype = "plantlike",
	visual_scale = 1.5 ,
	drop = "farming:corn 8"
})
