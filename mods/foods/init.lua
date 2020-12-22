local mp = minetest.get_modpath("foods")
dofile(mp .. "/jams.lua")
dofile(mp .. "/jellies.lua")
dofile(mp .. "/milkshakes.lua")
dofile(mp .. "/misc.lua")
dofile(mp .. "/pies.lua")

-- Bandit burger
minetest.register_craftitem("foods:bandit_burger", {
	description = "Bandit Burger",
	inventory_image = "foods_bandit_burger.png",
    on_use = minetest.item_eat(8)
})

minetest.register_craft( {
	type = "shapeless",
	output = "foods:bandit_burger",
	recipe = {"foods:bread", "group:food_meat"}
})

-- Beans With Onion
minetest.register_craftitem("foods:beans_with_onion_uncooked", {
	description = "Uncooked Beans With Onion",
	inventory_image = "foods_beans_with_onion_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:beans_with_onion_uncooked",
    recipe = {"foods:pot", "farming:bag_of_bean", "group:food_meat_raw", "foods:salt", "farming:onion", "foods:tomato_juice"},
	replacements = {
		{"foods:tomato_juice", "vessels:glass_bottle"},
        {"farming:bag_of_bean", "farming:bag"}
	}
})

minetest.register_craftitem("foods:beans_with_onion_pot", {
	description = "Pot of Beans With Onion",
	inventory_image = "foods_beans_with_onion_pot.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "foods:beans_with_onion_pot",
	recipe = "foods:beans_with_onion_uncooked"
})

minetest.register_craftitem("foods:beans_with_onion", {
	description = "Bowl of Beans With Onion",
	inventory_image = "foods_beans_with_onion.png",
	on_use = minetest.item_eat(15)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:beans_with_onion 5",
	recipe = {"foods:beans_with_onion_pot", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl"},
    replacements = {
		{"foods:beans_with_onion_pot", "foods:pot"}
	}
})

-- Borsch
minetest.register_craftitem("foods:borsch_uncooked", {
	description = "Uncooked Borsch",
	inventory_image = "foods_borsch_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:borsch_uncooked",
    recipe = {"foods:pot", "foods:salt", "farming:carrot", "farming:lettuce", "bucket:bucket_water", "group:food_meat_raw", "farming:potato", "farming:beetroot", "farming:beetroot"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("foods:borsch_pot", {
	description = "Pot of Borsch",
	inventory_image = "foods_borsch_pot.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "foods:borsch_pot",
	recipe = "foods:borsch_uncooked"
})

minetest.register_craftitem("foods:borsch", {
	description = "Bowl of Borsch",
	inventory_image = "foods_borsch.png",
	on_use = minetest.item_eat(10)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:borsch 5",
	recipe = {"foods:borsch_pot", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl"},
    replacements = {
		{"foods:borsch_pot", "foods:pot"}
	}
})

-- Bread
minetest.register_craftitem("foods:bread_dough", {
	description = "Bread Dough",
	inventory_image = "foods_bread_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:bread_dough",
    recipe = {"foods:flour", "mobs:egg", "foods:salt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}
	}
})

minetest.register_craftitem("foods:bread", {
	description = "Bread",
	inventory_image = "foods_bread.png",
	on_use = minetest.item_eat(5),
	groups = {food_bread = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:bread",
	recipe = "foods:bread_dough"
})

-- Burger
minetest.register_craftitem("foods:burger", {
    description = "Burger",
    inventory_image = "foods_burger.png",
    on_use = minetest.item_eat(9),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:burger",
    recipe = {"foods:bread", "group:food_meat", "farming:onion", "mobs:chicken_egg_fried",
    "mobs:cheese", "farming:cucumber", "farming:tomato", "farming:lettuce"}
})

-- Buterbrod
minetest.register_craftitem("foods:buterbrod", {
    description = "Buterbrod",
    inventory_image = "foods_buterbrod.png",
    on_use = minetest.item_eat(5),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:buterbrod 5",
    recipe = {"foods:bread", "mobs:butter", "group:food_meat", "mobs:cheese"}
})

-- Buttered bread with honey
minetest.register_craftitem("foods:buttered_bread_with_honey", {
    description = "Buttered Bread with Honey",
    inventory_image = "foods_buttered_bread_with_honey.png",
    on_use = minetest.item_eat(5),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:buttered_bread_with_honey 5",
    recipe = {"foods:bread", "mobs:butter", "foods:jar_of_honey"}
})

-- Caramel
minetest.register_craftitem("foods:caramel", {
    description = "Caramel",
    inventory_image = "foods_caramel.png",
    on_use = minetest.item_eat(-1),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:caramel",
	recipe = "foods:sugar"
})

-- Carrot Cake
minetest.register_craftitem("foods:carrot_cake_dough", {
	description = "Carrot Cake Dough",
	inventory_image = "foods_carrot_cake_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:carrot_cake_dough",
    recipe = {"farming:carrot", "foods:flour", "mobs:egg", "foods:sugar", "mobs:bucket_milk", "mobs:butter"},
   replacements = {
       {"mobs:bucket_milk", "bucket:bucket_empty"},
       {"foods:flour", "default:paper"}
   }
})

minetest.register_craftitem("foods:carrot_cake", {
    description = "Carrot Cake",
    inventory_image = "foods_carrot_cake.png",
    on_use = minetest.item_eat(7)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:carrot_cake",
	recipe = "foods:carrot_cake_dough"
})

-- Chicken soup
minetest.register_craftitem("foods:chicken_soup_uncooked", {
    description = "Uncooked Chicken Soup",
	inventory_image = "foods_chicken_soup_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:chicken_soup_uncooked",
    recipe = {"foods:pot", "farming:bag_of_peas", "foods:salt", "bucket:bucket_water", "mobs:chicken_raw", "farming:potato", "farming:carrot"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"farming:bag_of_peas", "farming:bag"}
	}
})

minetest.register_craftitem("foods:chicken_soup_pot", {
	description = "Pot of Chicken Soup",
	inventory_image = "foods_chicken_soup_pot.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "foods:chicken_soup_pot",
	recipe = "foods:chicken_soup_uncooked"
})

minetest.register_craftitem("foods:chicken_soup", {
	description = "Bowl of Chicken Soup",
	inventory_image = "foods_chicken_soup.png",
	on_use = minetest.item_eat(15)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:chicken_soup 5",
	recipe = {"foods:chicken_soup_pot", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl"},
    replacements = {
		{"foods:chicken_soup_pot", "foods:pot"}
	}
})

-- Chocolate
minetest.register_craftitem("foods:chocolate", {
    description = "Chocolate",
    inventory_image = "foods_chocolate.png",
    on_use = minetest.item_eat(2),
})

minetest.register_craft({
    output = "foods:chocolate",
    recipe = {
        {"farming:cocoa", "farming:cocoa", "farming:cocoa"},
        {"farming:cocoa", "farming:cocoa", "farming:cocoa"}
    }
})

-- Cookie
minetest.register_craftitem("foods:cookie_dough", {
	description = "Cookie Dough",
	inventory_image = "foods_cookie_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft( {
	type = "shapeless",
	output = "foods:cookie_dough",
	recipe = {"foods:flour", "foods:sugar", "mobs:egg", "farming:cocoa", "mobs:bucket_milk", "mobs:butter"},
    replacements = {
        {"foods:flour", "default:paper"},
        {"mobs:bucket_milk", "bucket:bucket_empty"}
    }
})

minetest.register_craftitem("foods:cookie", {
	description = "Cookie",
	inventory_image = "foods_cookie.png",
    on_use = minetest.item_eat(2)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 8,
	output = "foods:cookie 2",
	recipe = "foods:cookie_dough"
})

-- Corn Bread
minetest.register_craftitem("foods:corn_bread_dough", {
	description = "Corn Bread Dough",
	inventory_image = "foods_corn_bread_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:corn_bread_dough",
    recipe = {"farming:corn", "farming:corn", "foods:flour", "mobs:egg", "foods:salt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}
	}
})

minetest.register_craftitem("foods:corn_bread", {
    description = "Corn Bread",
    inventory_image = "foods_corn_bread.png",
    on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:corn_bread",
	recipe = "foods:corn_bread_dough"
})

-- Garlic Bread
minetest.register_craftitem("foods:garlic_bread", {
	description = "Garlic Bread",
	inventory_image = "foods_garlic_bread.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:garlic_bread 5",
	recipe = {"farming:garlic", "foods:bread"}
})

--Jammed sandwiches
minetest.register_craftitem("foods:jam_ananas_sandwich", {
    description = "Ananas Jam Sandwich",
    inventory_image = "foods_jam_ananas_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:jam_ananas_sandwich 5",
    recipe = {"foods:bread", "foods:jam_ananas"},
    replacements = {
		{"foods:jam_ananas", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jam_blueberry_sandwich", {
    description = "Blueberry Jam Sandwich",
    inventory_image = "foods_jam_blueberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:jam_blueberry_sandwich 5",
    recipe = {"foods:bread", "foods:jam_blueberry"},
    replacements = {
		{"foods:jam_blueberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jam_grape_sandwich", {
    description = "Grape Jam Sandwich",
    inventory_image = "foods_jam_grape_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:jam_grape_sandwich 5",
    recipe = {"foods:bread", "foods:jam_grape"},
    replacements = {
		{"foods:jam_grape", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jam_huckleberry_sandwich", {
    description = "Huckleberry Jam Sandwich",
    inventory_image = "foods_jam_huckleberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:jam_huckleberry_sandwich 5",
    recipe = {"foods:bread", "foods:jam_huckleberry"},
    replacements = {
		{"foods:jam_huckleberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jam_raspberry_sandwich", {
    description = "Raspberry Jam Sandwich",
    inventory_image = "foods_jam_raspberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:jam_raspberry_sandwich 5",
    recipe = {"foods:bread", "foods:jam_raspberry"},
    replacements = {
		{"foods:jam_raspberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jam_strawberry_sandwich", {
    description = "Strawberry Jam Sandwich",
    inventory_image = "foods_jam_strawberry_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:jam_strawberry_sandwich 5",
    recipe = {"foods:bread", "foods:jam_strawberry"},
    replacements = {
		{"foods:jam_strawberry", "vessels:glass_jar"}
	}
})

-- Meatloaf
minetest.register_craftitem("foods:meatloaf_unbaked", {
	description = "Unbaked Meatloaf",
	inventory_image = "foods_meatloaf_unbaked.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:meatloaf_unbaked",
    recipe = {"foods:minced_meat", "foods:bread", "mobs:egg", "farming:onion"},
})

minetest.register_craftitem("foods:meatloaf", {
    description = "Meatloaf",
    inventory_image = "foods_meatloaf.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:meatloaf",
	recipe = "foods:meatloaf_unbaked"
})

--Muffins
minetest.register_craftitem("foods:muffin_blueberry_dough", {
	description = "Blueberry Muffin Dough",
	inventory_image = "foods_muffin_blueberry_dough.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:muffin_blueberry_dough",
    recipe = {"foods:flour", "mobs:egg", "foods:sugar", "mobs:bucket_milk", "farming:blueberry"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}
	}
})

minetest.register_craftitem("foods:muffin_blueberry", {
	description = "Blueberry Muffin",
	inventory_image = "foods_muffin_blueberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:muffin_blueberry",
	recipe = "foods:muffin_blueberry_dough"
})

-- Peas mashed
minetest.register_craftitem("foods:peas_mashed_uncooked", {
    description = "Uncooked Mashed Peas",
	inventory_image = "foods_peas_mashed_uncooked.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:peas_mashed_uncooked",
    recipe = {"foods:pot", "farming:bag_of_peas", "mobs:bucket_milk"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"farming:bag_of_peas", "farming:bag"}
	}
})

minetest.register_craftitem("foods:peas_mashed_pot", {
	description = "Pot of Mashed Peas",
	inventory_image = "foods_peas_mashed_pot.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "foods:peas_mashed_pot",
	recipe = "foods:peas_mashed_uncooked"
})

minetest.register_craftitem("foods:peas_mashed", {
	description = "Bowl of Mashed Peas",
	inventory_image = "foods_peas_mashed.png",
	on_use = minetest.item_eat(15)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:peas_mashed 5",
	recipe = {"foods:peas_mashed_pot", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl"},
    replacements = {
		{"foods:peas_mashed_pot", "foods:pot"}
	}
})

--Peanut Butter sandwich
minetest.register_craftitem("foods:peanut_butter_sandwich", {
    description = "Peanut Butter Sandwich",
    inventory_image = "foods_peanut_butter_sandwich.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:peanut_butter_sandwich 5",
    recipe = {"foods:bread", "foods:peanut_butter"},
    replacements = {
		{"foods:peanut_butter", "vessels:glass_jar"}
	}
})

-- Popcorn
minetest.register_craftitem("foods:popcorn_uncooked", {
	description = "Uncooked Popcorn",
	inventory_image = "foods_popcorn_uncooked.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:popcorn_uncooked",
	recipe = {"foods:paper_bag", "farming:seed_corn", "farming:seed_corn", "farming:seed_corn", "farming:seed_corn",
              "farming:seed_corn", "farming:seed_corn", "farming:seed_corn", "farming:seed_corn"}
})

minetest.register_craftitem("foods:popcorn", {
	description = "Popcorn",
	inventory_image = "foods_popcorn.png",
	on_use = minetest.item_eat(3, "foods:paper_bag"),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:popcorn",
	recipe = "foods:popcorn_uncooked"
})

-- Potato mashed
minetest.register_craftitem("foods:potato_mashed_pot", {
    description = "Pot of Mashed Potato",
    inventory_image = "foods_potato_mashed_pot.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:potato_mashed_pot",
    recipe = {"foods:pot", "farming:potato_baked", "farming:potato_baked", "farming:potato_baked", "farming:potato_baked", "mobs:butter"},
})

minetest.register_craftitem("foods:potato_mashed", {
    description = "Bowl of Mashed Potato",
    inventory_image = "foods_potato_mashed.png",
    on_use = minetest.item_eat(7, "foods:bowl")
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:potato_mashed 5",
    recipe = {"foods:potato_mashed_pot", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl"},
    replacements = {
		{"foods:potato_mashed_pot", "foods:pot"}
	}

})

-- Rice cooked
minetest.register_craftitem("foods:rice_uncooked_pot", {
    description = "Pot of Uncooked Rice",
    inventory_image = "foods_rice_uncooked_pot.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:rice_uncooked_pot",
    recipe = {"foods:pot", "farming:bag_of_rice", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"farming:bag_of_rice", "farming:bag"}
	}
})

minetest.register_craftitem("foods:rice_cooked_pot", {
    description = "Pot of Cooked Rice",
    inventory_image = "foods_rice_cooked_pot.png"
})

minetest.register_craft({
    type = "cooking",
    cooktime = 18,
    output = "foods:rice_cooked_pot",
    recipe = "foods:rice_uncooked_pot"
})

minetest.register_craftitem("foods:rice_cooked", {
    description = "Cooked Rice",
    inventory_image = "foods_rice_cooked.png",
    on_use = minetest.item_eat(5)
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:rice_cooked 5",
    recipe = {"foods:rice_cooked_pot", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl"},
	replacements = {
		{"foods:rice_cooked_pot", "foods:pot"}
	}
})

-- Rizibizi
minetest.register_craftitem("foods:rizibizi_uncooked_pot", {
	description = "Pot of Uncooked Rizibizi",
	inventory_image = "foods_rizibizi_uncooked_pot.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:rizibizi_uncooked_pot",
    recipe = {"foods:pot", "farming:bag_of_rice", "farming:carrot", "farming:bag_of_peas", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
        {"farming:bag_of_rice", "farming:bag"},
        {"farming:bag_of_pea", "farming:bag"}
	}
})

minetest.register_craftitem("foods:rizibizi_cooked_pot", {
	description = "Pot of Rizibizi",
	inventory_image = "foods_rizibizi_cooked_pot.png",
})

minetest.register_craft({
    type = "cooking",
    cooktime = 18,
    output = "foods:rizibizi_cooked_pot",
    recipe = "foods:rizibizi_uncooked_pot"
})

minetest.register_craftitem("foods:rizibizi", {
	description = "Rizibizi",
	inventory_image = "foods_rizibizi.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:rizibizi 5",
    recipe = {"foods:rizibizi_cooked_pot", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl", "foods:bowl"},
	replacements = {
		{"foods:rizibizi_cooked_pot", "foods:pot"}
	}
})

-- Strawberry Cake
minetest.register_craftitem("foods:strawberry_cake_dough", {
    description = "Strawberry Cake Dough",
    inventory_image = "foods_strawberry_cake_dough.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:strawberry_cake_dough",
    recipe = {"farming:strawberry", "farming:strawberry", "foods:flour",
    "mobs:egg", "foods:sugar", "mobs:bucket_milk", "mobs:butter"},
	replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
        {"foods:flour", "default:paper"}
	}
})

minetest.register_craftitem("foods:strawberry_cake", {
	description = "Strawberry Cake",
	inventory_image = "foods_strawberry_cake.png",
	on_use = minetest.item_eat(7),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:strawberry_cake",
	recipe = "foods:strawberry_cake_dough"
})
