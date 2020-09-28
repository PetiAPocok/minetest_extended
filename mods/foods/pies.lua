-- Apple
minetest.register_craftitem("foods:pie_apple_dough", {
	description = "Apple Pie Dough",
	inventory_image = "foods_pie_apple_dough.png",
    on_use = minetest.item_eat(-1)
 })

minetest.register_craft({
    type = "shapeless",
    output = "foods:pie_apple_dough",
    recipe = {"farming:apple", "farming:apple", "foods:flour", "mobs:egg", "foods:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}

	}
})

minetest.register_craftitem("foods:pie_apple", {
    description = "Apple Pie",
    inventory_image = "foods_pie_apple.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:pie_apple",
	recipe = "foods:pie_apple_dough"
})

-- Blueberry
minetest.register_craftitem("foods:pie_blueberry_dough", {
	description = "Blueberry Pie Dough",
	inventory_image = "foods_pie_blueberry_dough.png",
    on_use = minetest.item_eat(-1)
 })

minetest.register_craft({
    type = "shapeless",
    output = "foods:pie_blueberry_dough",
    recipe = {"farming:blueberry", "farming:blueberry", "foods:flour", "mobs:egg", "foods:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}

	}
})

minetest.register_craftitem("foods:pie_blueberry", {
    description = "Blueberry Pie",
    inventory_image = "foods_pie_blueberry.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:pie_blueberry",
	recipe = "foods:pie_blueberry_dough"
})

-- Huckleberry Pie
minetest.register_craftitem("foods:pie_huckleberry_dough", {
	description = "Huckleberry Pie Dough",
	inventory_image = "foods_pie_huckleberry_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:pie_huckleberry_dough",
    recipe = {"farming:huckleberry", "farming:huckleberry", "foods:flour", "mobs:egg", "foods:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}
	}
})

minetest.register_craftitem("foods:pie_huckleberry", {
    description = "Huckleberry Pie",
    inventory_image = "foods_pie_huckleberry.png",
    on_use = minetest.item_eat(7)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:pie_huckleberry",
	recipe = "foods:pie_huckleberry_dough"
})

-- Huckleberry Pie
minetest.register_craftitem("foods:pie_huckleberry_dough", {
	description = "Huckleberry Pie Dough",
	inventory_image = "foods_pie_huckleberry_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:pie_huckleberry_dough",
    recipe = {"farming:huckleberry", "farming:huckleberry", "foods:flour",
    "mobs:egg", "foods:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}
	}
})

minetest.register_craftitem("foods:pie_huckleberry", {
    description = "Huckleberry Pie",
    inventory_image = "foods_pie_huckleberry.png",
    on_use = minetest.item_eat(7)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:pie_huckleberry",
	recipe = "foods:pie_huckleberry_dough"
})

-- Raspberry Pie
minetest.register_craftitem("foods:pie_raspberry_dough", {
    description = "Raspberry Pie Dough",
    inventory_image = "foods_pie_raspberry_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:pie_raspberry_dough",
    recipe = {"farming:raspberry", "farming:raspberry", "foods:flour",
    "mobs:egg", "foods:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}
	}
})

minetest.register_craftitem("foods:pie_raspberry", {
	description = "Raspberry Pie",
	inventory_image = "foods_pie_raspberry.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:pie_raspberry",
	recipe = "foods:pie_raspberry_dough"
})
