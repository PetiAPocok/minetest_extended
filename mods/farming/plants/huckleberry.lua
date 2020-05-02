farming.register_plant("farming:huckleberry", {
	description = "Huckleberry Seeds",
	inventory_image = "farming_huckleberry_seeds.png",
	steps = 5,
	minlight = 12,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
})

-- Change Drawtype of the plants
for i = 3 , 5 do
	minetest.override_item("farming:huckleberry_"..i, {
		drawtype = "mesh",
		mesh = "farming_huckleberry_bush.obj",
	})
end

minetest.override_item("farming:huckleberry_2", {
	drawtype = "mesh",
	mesh = "farming_huckleberry_bush_2.obj",
})

-- Override drop
minetest.override_item("farming:huckleberry_5", {
	drawtype = "mesh",
	mesh = "farming_huckleberry_bush.obj",
	drop = "farming:huckleberry 3"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_huckleberry",
	recipe = {"farming:huckleberry"}
})

-- make huckleberry eatable
minetest.override_item("farming:huckleberry", {
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("farming:huckleberry_pie_dough", {
	description = "Huckleberry Pie Dough ",
	inventory_image = "farming_huckleberry_pie_dough.png"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:huckleberry_pie_dough",
    recipe = {"farming:huckleberry", "farming:huckleberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:huckleberry_pie", {
    description = "Huckleberry Pie",
    inventory_image = "farming_huckleberry_pie.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:huckleberry_pie",
	recipe = "farming:huckleberry_pie_dough"
})
