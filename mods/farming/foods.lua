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
	recipe = {"farming:beans_with_onion_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"},
    replacements = {
		{"farming:beans_with_onion_pot", "farming:pot"}
	}
})

-- Borsch
minetest.register_craftitem("farming:borsch_uncooked", {
	description = "Uncooked Borsch",
	inventory_image = "farming_borsch_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:borsch_uncooked",
    recipe = {"farming:pot", "farming:bag_of_peas", "farming:salt", "farming:lettuce", "bucket:bucket_water", "farming:beetroot", "farming:beetroot", "farming:beetroot", "farming:beetroot"},
	replacements = {
		{"bucket:bucket_water", "bucket:empty"},
        {"farming:bag_of_peas", "farming:bag"}
	}
})

minetest.register_craftitem("farming:borsch_pot", {
	description = "Pot of Borsch",
	inventory_image = "farming_borsch_pot.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "farming:borsch_pot",
	recipe = "farming:borsch_uncooked"
})

minetest.register_craftitem("farming:borsch", {
	description = "Bowl of Borsch",
	inventory_image = "farming_borsch.png",
	on_use = minetest.item_eat(10)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:borsch 5",
	recipe = {"farming:borsch_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"},
    replacements = {
		{"farming:borsch_pot", "farming:pot"}
	}
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

-- Buterbrod
minetest.register_craftitem("farming:buterbrod", {
    description = "Buterbrod",
    inventory_image = "farming_buterbrod.png",
    on_use = minetest.item_eat(5),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:buterbrod",
    recipe = {"farming:bread", "mobs_animal:butter", "group:food_meat", "mobs_animal:cheese"}
})

-- Buttered bread with honey
minetest.register_craftitem("farming:buttered_bread_with_honey", {
    description = "Buttered Bread with Honey",
    inventory_image = "farming_buttered_bread_with_honey.png",
    on_use = minetest.item_eat(5),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:buttered_bread_with_honey",
    recipe = {"farming:bread", "mobs_animal:butter", "mobs_animal:honey"}
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

-- Chicken soup
minetest.register_craftitem("farming:chicken_soup_uncooked", {
    description = "Uncooked Chicken Soup",
	inventory_image = "farming_chicken_soup_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:chicken_soup",
    recipe = {"farming:pot", "farming:bag_of_peas", "farming:salt", "bucket:bucket_water", "mobs_animal:chicken_raw", "farming:potato", "farming:carrot"},
	replacements = {
		{"bucket:bucket_water", "bucket:empty"},
        {"farming:bag_of_peas", "farming:bag"}
	}
})

minetest.register_craftitem("farming:chicken_soup_pot", {
	description = "Pot of Chicken Soup",
	inventory_image = "farming_chicken_soup_pot.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "farming:chicken_soup_pot",
	recipe = "farming:chicken_soup_uncooked"
})

minetest.register_craftitem("farming:chicken_soup", {
	description = "Bowl of Chicken Soup",
	inventory_image = "farming_chicken_soup.png",
	on_use = minetest.item_eat(15)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:chicken_soup 5",
	recipe = {"farming:chicken_soup_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"},
    replacements = {
		{"farming:chicken_soup_pot", "farming:pot"}
	}
})

-- Chocolate
minetest.register_craftitem("farming:chocolate", {
    description = "Chocolate",
    inventory_image = "farming_chocolate.png",
    on_use = minetest.item_eat(2),
})

minetest.register_craft({
    output = "farming:chocolate",
    recipe = {
        {"farming:cocoa", "farming:cocoa", "farming:cocoa"},
        {"farming:cocoa", "farming:cocoa", "farming:cocoa"}
    }
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
	recipe = {"farming:jam_ananas", "bones:gelatin_powder"},
    replacements = {
		{"farming:jam_ananas", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jelly_blueberry", {
	description = "Blueberry Jelly",
	inventory_image = "farming_jelly_blueberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_blueberry",
	recipe = {"farming:jam_blueberry", "bones:gelatin_powder"},
    replacements = {
		{"farming:jam_blueberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jelly_grape", {
	description = "Grape Jelly",
	inventory_image = "farming_jelly_grape.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_grape",
	recipe = {"farming:jam_grape", "bones:gelatin_powder"},
    replacements = {
		{"farming:jam_grape", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jelly_huckleberry", {
	description = "Huckleberry Jelly",
	inventory_image = "farming_jelly_huckleberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_huckleberry",
	recipe = {"farming:jam_huckleberry", "bones:gelatin_powder"},
    replacements = {
		{"farming:jam_huckleberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jelly_raspberry", {
	description = "Raspberry Jelly",
	inventory_image = "farming_jelly_raspberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_raspberry",
	recipe = {"farming:jam_raspberry", "bones:gelatin_powder"},
    replacements = {
		{"farming:jam_raspberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("farming:jelly_strawberry", {
	description = "Strawberry Jelly",
	inventory_image = "farming_jelly_strawberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_strawberry",
	recipe = {"farming:jam_strawberry", "bones:gelatin_powder"},
    replacements = {
		{"farming:jam_strawberry", "vessels:glass_jar"}
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
		{"farming:jam_ananas", "vessels:glass_jar"}
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

minetest.register_craftitem("farming:jam_grape_sandwich", {
    description = "Grape Jam Sandwich",
    inventory_image = "farming_jam_grape_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:jam_grape_sandwich 5",
    recipe = {"farming:bread", "farming:jam_grape"},
    replacements = {
		{"farming:jam_grape", "vessels:glass_jar"}
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
	output = "farming:milkshake_blueberry 3",
	recipe = {"farming:jam_blueberry", "mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:cocoa_drink", {
    description = "Cocoa Drink",
    inventory_image = "farming_cocoa_drink.png",
    on_use = minetest.item_eat(2, "vessels:glass_jar"),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:cocoa_drink 3",
    recipe = {"mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar", "vessels:glass_jar", "farming:chocolate"},
    replacements = {
        {"mobs:bucket_milk", "bucket:bucket_empty"}
    }
})

minetest.register_craftitem("farming:milkshake_raspberry", {
	description = "Raspberry Milkshake",
	inventory_image = "farming_milkshake_raspberry.png",
	on_use = minetest.item_eat(2, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:milkshake_raspberry 3",
	recipe = {"farming:jam_raspberry", "mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("farming:milkshake_strawberry", {
	description = "Strawberry Milkshake",
	inventory_image = "farming_milkshake_strawberry.png",
	on_use = minetest.item_eat(2, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:milkshake_strawberry 2",
	recipe = {"farming:jam_strawberry", "mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

--Muffins
minetest.register_craftitem("farming:muffin_blueberry_dough", {
	description = "Blueberry Muffin Dough",
	inventory_image = "farming_muffin_blueberry_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:muffin_blueberry_dough",
    recipe = {"farming:flour", "mobs:egg", "farming:sugar", "mobs_animal:bucket_milk", "farming:blueberry"},
	replacements = {
		{"mobs_animal:bucket_milk", "bucket:bucket_empty"},
        {"farming:flour", "default:paper"}
	}
})

minetest.register_craftitem("farming:muffin_blueberry", {
	description = "Blueberry Muffin",
	inventory_image = "farming_muffin_blueberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:muffin_blueberry",
	recipe = "farming:muffin_blueberry_dough"
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


-- Peas mashed
minetest.register_craftitem("farming:peas_mashed_uncooked", {
    description = "Uncooked Mashed Peas",
	inventory_image = "farming_peas_mashed_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:peas_mashed_uncooked",
    recipe = {"farming:pot", "farming:bag_of_peas", "mobs_animal:bucket_milk"},
	replacements = {
		{"mobs_animal:bucket_milk", "bucket:empty"},
        {"farming:bag_of_peas", "farming:bag"}
	}
})

minetest.register_craftitem("farming:peas_mashed_pot", {
	description = "Pot of Mashed Peas",
	inventory_image = "farming_peas_mashed_pot.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "farming:peas_mashed_pot",
	recipe = "farming:peas_mashed_uncooked"
})

minetest.register_craftitem("farming:peas_mashed", {
	description = "Bowl of Mashed Peas",
	inventory_image = "farming_peas_mashed.png",
	on_use = minetest.item_eat(15)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:peas_mashed 5",
	recipe = {"farming:peas_mashed_pot", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl", "farming:bowl"},
    replacements = {
		{"farming:peas_mashed_pot", "farming:pot"}
	}
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

-- Popcorn
minetest.register_craftitem("farming:popcorn_uncooked", {
	description = "Uncooked Popcorn",
	inventory_image = "farming_popcorn_uncooked.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:popcorn_uncooked",
	recipe = {"farming:paper_bag", "farming:seed_corn", "farming:seed_corn", "farming:seed_corn", "farming:seed_corn",
              "farming:seed_corn", "farming:seed_corn", "farming:seed_corn", "farming:seed_corn"}
})

minetest.register_craftitem("farming:popcorn", {
	description = "Popcorn",
	inventory_image = "farming_popcorn.png",
	on_use = minetest.item_eat(3, "farming:paper_bag"),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:popcorn",
	recipe = "farming:popcorn_uncooked"
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
