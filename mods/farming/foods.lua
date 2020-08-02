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
    recipe = {"farming:pot", "farming:bag_of_bean", "group:food_meat_raw", "farming:salt", "farming:onion", "farming:tomato_juice"},
	replacements = {
		{"farming:tomato_juice", "vessels:glass_bottle"},
        {"farming:bag_of_bean", "farming:bag"}
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
	recipe = {"farming:beans_with_onion_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"}
})

-- Bread
minetest.register_craftitem("farming:bread_dough", {
	description = "Bread Dough",
	inventory_image = "farming_bread_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:bread_dough",
    recipe = {"farming:flour", "mobs:egg", "farming:salt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}
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
    on_use = minetest.item_eat(-1)
 })

minetest.register_craft({
    type = "shapeless",
    output = "farming:blueberry_pie_dough",
    recipe = {"farming:blueberry", "farming:blueberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}

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
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:carrot_cake_dough",
    recipe = {"farming:carrot", "farming:flour", "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
   replacements = {
       {"mobs:bucket_milk", "bucket:bucket_empty"},
       {"farming:flour", "default:paper"}
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
	inventory_image = "farming_cookie_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft( {
	type = "shapeless",
	output = "farming:cookie_dough",
	recipe = {"farming:flour", "farming:sugar", "mobs:egg", "farming:cocoa"},
    replacements = {
        {"farming:flour", "default:paper"}
    }
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
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:corn_bread_dough",
    recipe = {"farming:corn", "farming:corn", "farming:flour", "mobs:egg", "farming:salt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}
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

-- Jelly
minetest.register_craftitem("farming:jelly_ananas", {
	description = "Ananas Jelly",
	inventory_image = "farming_jelly_ananas.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_ananas",
	recipe = {"farming:jam_ananas", "bones:gelatin_powder"}
})

minetest.register_craftitem("farming:jelly_blueberry", {
	description = "Blueberry Jelly",
	inventory_image = "farming_jelly_blueberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_blueberry",
	recipe = {"farming:jam_blueberry", "bones:gelatin_powder"}
})

minetest.register_craftitem("farming:jelly_huckleberry", {
	description = "Huckleberry Jelly",
	inventory_image = "farming_jelly_huckleberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_huckleberry",
	recipe = {"farming:jam_huckleberry", "bones:gelatin_powder"}
})

minetest.register_craftitem("farming:jelly_raspberry", {
	description = "Raspberry Jelly",
	inventory_image = "farming_jelly_raspberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_raspberry",
	recipe = {"farming:jam_raspberry", "bones:gelatin_powder"}
})

minetest.register_craftitem("farming:jelly_strawberry", {
	description = "Strawberry Jelly",
	inventory_image = "farming_jelly_strawberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_strawberry",
	recipe = {"farming:jam_strawberry", "bones:gelatin_powder"}
})

-- Huckleberry Pie
minetest.register_craftitem("farming:huckleberry_pie_dough", {
	description = "Huckleberry Pie Dough",
	inventory_image = "farming_huckleberry_pie_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:huckleberry_pie_dough",
    recipe = {"farming:huckleberry", "farming:huckleberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}
	}
})

minetest.register_craftitem("farming:huckleberry_pie", {
    description = "Huckleberry Pie",
    inventory_image = "farming_huckleberry_pie.png",
    on_use = minetest.item_eat(7)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:huckleberry_pie",
	recipe = "farming:huckleberry_pie_dough"
})

--Jammed sandwiches
minetest.register_craftitem("farming:jam_ananas_sandwich", {
    description = "Ananas Jam Sandwich",
    inventory_image = "farming_jam_ananas_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:jam_ananas_sandwich 5",
    recipe = {"farming:bread", "farming:jam_ananas"},
    replacements = {
		{"farming:peanut_butter", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jam_blueberry_sandwich", {
    description = "Blueberry Jam Sandwich",
    inventory_image = "farming_jam_blueberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:jam_blueberry_sandwich 5",
    recipe = {"farming:bread", "farming:jam_blueberry"},
    replacements = {
		{"farming:jam_blueberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jam_huckleberry_sandwich", {
    description = "Huckleberry Jam Sandwich",
    inventory_image = "farming_jam_huckleberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:jam_huckleberry_sandwich 5",
    recipe = {"farming:bread", "farming:jam_huckleberry"},
    replacements = {
		{"farming:jam_huckleberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jam_raspberry_sandwich", {
    description = "Raspberry Jam Sandwich",
    inventory_image = "farming_jam_raspberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:jam_raspberry_sandwich 5",
    recipe = {"farming:bread", "farming:jam_raspberry"},
    replacements = {
		{"farming:jam_raspberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jam_strawberry_sandwich", {
    description = "Strawberry Jam Sandwich",
    inventory_image = "farming_jam_strawberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:jam_strawberry_sandwich 5",
    recipe = {"farming:bread", "farming:jam_strawberry"},
    replacements = {
		{"farming:jam_strawberry", "vessels:glass_jar"}
	}
})

-- Meatloaf
minetest.register_craftitem("farming:meatloaf_unbaked", {
	description = "Unbaked Meatloaf",
	inventory_image = "farming_meatloaf_unbaked.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:meatloaf_unbaked",
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
	output = "farming:meatloaf",
	recipe = "farming:meatloaf_unbaked"
})

-- Milk Shakes
minetest.register_craftitem("farming:milkshake_blueberry", {
	description = "Blueberry Milkshake",
	inventory_image = "farming_milkshake_blueberry.png",
	on_use = minetest.item_eat(4, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:milkshake_blueberry 2",
	recipe = {"farming:jam_blueberry", "mobs:bucket_milk"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:milkshake_raspberry", {
	description = "Raspberry Milkshake",
	inventory_image = "farming_milkshake_raspberry.png",
	on_use = minetest.item_eat(4, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:milkshake_raspberry 2",
	recipe = {"farming:jam_raspberry", "mobs:bucket_milk"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:milkshake_strawberry", {
	description = "Strawberry Milkshake",
	inventory_image = "farming_milkshake_strawberry.png",
	on_use = minetest.item_eat(4, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:milkshake_strawberry 2",
	recipe = {"farming:jam_strawberry", "mobs:bucket_milk"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

-- Huckleberry Pie
minetest.register_craftitem("farming:huckleberry_pie_dough", {
	description = "Huckleberry Pie Dough",
	inventory_image = "farming_huckleberry_pie_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:huckleberry_pie_dough",
    recipe = {"farming:huckleberry", "farming:huckleberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}
	}
})

minetest.register_craftitem("farming:huckleberry_pie", {
    description = "Huckleberry Pie",
    inventory_image = "farming_huckleberry_pie.png",
    on_use = minetest.item_eat(7)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:huckleberry_pie",
	recipe = "farming:huckleberry_pie_dough"
})

--Peanut Butter sandwich
minetest.register_craftitem("farming:peanut_butter_sandwich", {
    description = "Peanut Butter Sandwich",
    inventory_image = "farming_peanut_butter_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:peanut_butter_sandwich 5",
    recipe = {"farming:bread", "farming:peanut_butter"},
    replacements = {
		{"farming:peanut_butter", "vessels:glass_jar"}
	}
})

-- Potato mashed
minetest.register_craftitem("farming:potato_mashed_pot", {
    description = "Pot of Mashed Potato",
    inventory_image = "farming_potato_mashed_pot.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:potato_mashed_pot",
    recipe = {"farming:pot", "farming:potato_baked", "farming:potato_baked", "farming:potato_baked", "farming:potato_baked", "mobs:butter"},
})

minetest.register_craftitem("farming:potato_mashed", {
    description = "Bowl of Mashed Potato",
    inventory_image = "farming_potato_mashed.png",
    on_use = minetest.item_eat(7, "farming:bowl")
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:potato_mashed 5",
    recipe = {"farming:potato_mashed_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"},
    replacements = {
		{"farming:potato_mashed_pot", "farming:pot"}
	}

})

-- Raspberry Pie
minetest.register_craftitem("farming:raspberry_pie_dough", {
    description = "Raspberry Pie Dough",
    inventory_image = "farming_raspberry_pie_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:raspberry_pie_dough",
    recipe = {"farming:raspberry", "farming:raspberry", "farming:flour",
    "mobs:egg", "farming:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}
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
minetest.register_craftitem("farming:rice_uncooked_pot", {
    description = "Pot of Uncooked Rice",
    inventory_image = "farming_rice_uncooked_pot.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:rice_uncooked_pot",
    recipe = {"farming:pot", "farming:bag_of_rice", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"farming:bag_of_rice", "farming:bag"}
	}
})

minetest.register_craftitem("farming:rice_cooked_pot", {
    description = "Pot of Cooked Rice",
    inventory_image = "farming_rice_cooked_pot.png"
})

minetest.register_craft({
    type = "cooking",
    cooktime = 18,
    output = "farming:rice_cooked_pot",
    recipe = "farming:rice_uncooked_pot"
})

minetest.register_craftitem("farming:rice_cooked", {
    description = "Cooked Rice",
    inventory_image = "farming_rice_cooked.png",
    on_use = minetest.item_eat(5)
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:rice_cooked 5",
    recipe = {"farming:rice_cooked_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"},
	replacements = {
		{"farming:rice_cooked_pot", "farming:pot"}
	}
})

-- Rizibizi
minetest.register_craftitem("farming:rizibizi_uncooked_pot", {
	description = "Pot of Uncooked Rizibizi",
	inventory_image = "farming_rizibizi_uncooked_pot.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:rizibizi_uncooked_pot",
    recipe = {"farming:pot", "farming:bag_of_rice", "farming:carrot", "farming:bag_of_pea", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"farming:bag_of_rice", "farming:bag"},
        {"farming:bag_of_pea", "farming:bag"}
	}
})

minetest.register_craftitem("farming:rizibizi_cooked_pot", {
	description = "Pot of Rizibizi",
	inventory_image = "farming_rizibizi_cooked_pot.png",
})

minetest.register_craft({
    type = "cooking",
    cooktime = 18,
    output = "farming:rizibizi_cooked_pot",
    recipe = "farming:rizibizi_uncooked_pot"
})

minetest.register_craftitem("farming:rizibizi", {
	description = "Rizibizi",
	inventory_image = "farming_rizibizi.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:rizibizi 5",
    recipe = {"farming:rizibizi_cooked_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"},
	replacements = {
		{"farming:rizibizi_cooked_pot", "farming:pot"}
	}
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
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}
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
