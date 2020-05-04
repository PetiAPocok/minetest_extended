-- Bandit burger
minetest.register_craftitem("farming:bandit_burger", {
	description = "Bandit Burger",
	inventory_image = "farming_bandit_burger.png",
    on_use = minetest.item_eat(8)
})

minetest.register_craft( {
	type = "shapeless",
	output = "farming:bandit_burger",
	recipe = {"farming:bread", "group:food_meat"}
})

-- Beans With Onion
minetest.register_craftitem("farming:beans_with_onion_uncooked", {
	description = "Uncooked Beans With Onion",
	inventory_image = "farming_beans_with_onion_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:beans_with_onion_uncooked",
    recipe = {"farming:pot", "farming:bag_of_beans", "group:food_meat_raw", "farming:salt", "farming:onion", "farming:tomato_juice"},
	replacements = {
		{"farming:tomato_juice", "vessels:glass_bottle"}
	}
})

minetest.register_craftitem("farming:beans_with_onion_pot", {
	description = "Pot of Beans With Onion",
	inventory_image = "farming_beans_with_onion_pot.png",
	on_use = minetest.item_eat(15)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "farming:beans_with_onion_pot",
	recipe = "farming:beans_with_onion_uncooked"
})

minetest.register_craftitem("farming:beans_with_onion", {
	description = "Bowl of Beans With Onion",
	inventory_image = "farming_beans_with_onion.png",
	on_use = minetest.item_eat(15)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:beans_with_onion 5",
	recipe = {"farming:beans_with_onion_pot", "farming:bowl 5"}
})

-- Bread
minetest.register_craftitem("farming:bread_dough", {
	description = "Bread Dough",
	inventory_image = "farming_bread_dough.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:bread_dough",
    recipe = {"farming:flour", "mobs:egg", "farming:salt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:bread", {
	description = "Bread",
	inventory_image = "farming_bread.png",
	on_use = minetest.item_eat(5),
	groups = {food_bread = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:bread",
	recipe = "farming:bread_dough"
})

-- Blueberry Pie
minetest.register_craftitem("farming:blueberry_pie_dough", {
	description = "Blueberry Pie Dough",
	inventory_image = "farming_blueberry_pie_dough.png",
 })

minetest.register_craft({
    type = "shapeless",
    output = "farming:blueberry_pie_dough",
    recipe = {"farming:blueberry", "farming:blueberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:blueberry_pie", {
    description = "Blueberry Pie",
    inventory_image = "farming_blueberry_pie.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:blueberry_pie",
	recipe = "farming:blueberry_pie_dough"
})

-- Burger
minetest.register_craftitem("farming:burger", {
    description = "Burger",
    inventory_image = "farming_burger.png",
    on_use = minetest.item_eat(9),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:burger",
    recipe = {"farming:bread", "group:food_meat", "farming:onion", "mobs:chicken_egg_fried",
    "mobs:cheese", "farming:cucumber", "farming:tomato", "farming:lettuce"}
})


-- Carrot Cake
minetest.register_craftitem("farming:carrot_cake_dough", {
	description = "Carrot Cake Dough",
	inventory_image = "farming_carrot_cake_dough.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:carrot_cake_dough",
    recipe = {"farming:carrot", "farming:flour", "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
   replacements = {
       {"mobs:bucket_milk", "bucket:bucket_empty"}
   }
})

minetest.register_craftitem("farming:carrot_cake", {
    description = "Carrot Cake",
    inventory_image = "farming_carrot_cake.png",
    on_use = minetest.item_eat(7)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:carrot_cake",
	recipe = "farming:carrot_cake_dough"
})

-- Cookie
minetest.register_craftitem("farming:cookie_dough", {
	description = "Cookie Dough",
	inventory_image = "farming_cookie_dough.png"
})

minetest.register_craft( {
	type = "shapeless",
	output = "farming:cookie_dough",
	recipe = {"farming:flour", "farming:sugar", "mobs:egg", "farming:cocoa"}
})

minetest.register_craftitem("farming:cookie", {
	description = "Cookie",
	inventory_image = "farming_cookie.png",
    on_use = minetest.item_eat(2)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 8,
	output = "farming:cookie 2",
	recipe = "farming:cookie_dough"
})

-- Corn Bread
minetest.register_craftitem("farming:corn_bread_dough", {
	description = "Corn Bread Dough",
	inventory_image = "farming_corn_bread_dough.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:corn_bread_dough",
    recipe = {"farming:corn", "farming:corn", "farming:flour", "mobs:egg", "farming:salt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:corn_bread", {
    description = "Corn Bread",
    inventory_image = "farming_corn_bread.png",
    on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:corn_bread",
	recipe = "farming:corn_bread_dough"
})

-- Garlic Bread
minetest.register_craftitem("farming:garlic_bread", {
	description = "Garlic Bread",
	inventory_image = "farming_garlic_bread.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:garlic_bread 7",
	recipe = {"farming:garlic", "farming:bread"}
})

-- Huckleberry Pie
minetest.register_craftitem("farming:huckleberry_pie_dough", {
	description = "Huckleberry Pie Dough",
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

-- Meatloaf
minetest.register_craftitem("farming:meatloaf_raw", {
	description = "Raw Meatloaf",
	inventory_image = "farming_meatloaf_raw.png"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:meatloaf_raw",
    recipe = {"farming:minced_meat", "farming:bread", "mobs:egg", "farming:onion"},
})

minetest.register_craftitem("farming:meatloaf", {
    description = "Meatloaf",
    inventory_image = "farming_meatloaf.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:huckleberry_pie",
	recipe = "farming:huckleberry_pie_dough"
})

-- Milk Shake

-- Potato mashed
minetest.register_craftitem("farming:potato_mashed", {
    description = "Mashed Potato",
    inventory_image = "farming_potato_mashed.png",
    on_use = minetest.item_eat(5),
})

-- Raspberry Pie
minetest.register_craftitem("farming:raspberry_pie_dough", {
    description = "Raspberry Pie Dough",
    inventory_image = "farming_raspberry_pie_dough.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:raspberry_pie_dough",
    recipe = {"farming:raspberry", "farming:raspberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:raspberry_pie", {
	description = "Raspberry Pie",
	inventory_image = "farming_raspberry_pie.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:raspberry_pie",
	recipe = "farming:raspberry_pie_dough"
})

-- Rice cooked
minetest.register_craftitem("farming:rice_cooked", {
    description = "Cooked Rice",
    inventory_image = "farming_rice_cooked.png",
    on_use = minetest.item_eat(5)
})

-- Rice pudding
minetest.register_craftitem("farming:rice_pudding", {
    description = "Rice Pudding",
    inventory_image = "farming_rice_pudding.png",
    on_use = minetest.item_eat(5)
})

-- Rizibizi
minetest.register_craftitem("farming:rizibizi", {
	description = "Rizibizi",
	inventory_image = "farming_rizibizi.png",
	on_use = minetest.item_eat(7),
})

-- Strawberry Cake
minetest.register_craftitem("farming:strawberry_cake_dough", {
    description = "Strawberry Cake Dough",
    inventory_image = "farming_strawberry_cake_dough.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:strawberry_cake_dough",
    recipe = {"farming:strawberry", "farming:strawberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:strawberry_cake", {
	description = "Strawberry Cake",
	inventory_image = "farming_strawberry_cake.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:strawberry_cake",
	recipe = "farming:strawberry_cake_dough"
})

-- Tomato juice
minetest.register_craftitem("farming:tomato_juice", {
	description = "Tomato Juice",
	inventory_image = "farming_tomato_juice.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:tomato_juice",
	recipe = {"farming:tomato", "vessels:glass_bottle"}
})
