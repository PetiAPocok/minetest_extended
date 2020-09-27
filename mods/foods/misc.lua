-- Bowl
minetest.register_craftitem("foods:bowl", {
	description = "Bowl",
	inventory_image = "foods_bowl.png"
})

minetest.register_craft({
    output = "foods:bowl 2",
    recipe = {
        {"group:wood", "", "group:wood"},
        {"", "group:wood", ""},
    }
})

-- Pot
minetest.register_craftitem("foods:pot", {
	description = "Pot",
	inventory_image = "foods_pot.png"
})

minetest.register_craft({
    output = "foods:pot 2",
    recipe = {
        {"default:tin_ingot", "", "default:tin_ingot"},
        {"default:tin_ingot", "", "default:tin_ingot"},
        {"", "default:tin_ingot", ""}
    }
})

-- Flour
minetest.register_craftitem("foods:flour", {
	description = "Flour",
	inventory_image = "foods_flour.png",
	groups = {food_flour = 1, flammable = 1},
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:flour",
    recipe = {"farming:wheat", "farming:wheat", "farming:wheat", "default:paper"}
})

-- Jams
minetest.register_craftitem("foods:jam_ananas", {
	description = "Ananas Jam",
	inventory_image = "foods_jam_ananas.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "foods:jam_ananas",
    recipe = {
        {"", "", ""},
        {"", "farming:ananas", ""},
        {"foods:sugar", "vessels:glass_jar", "foods:sugar"}
    }
})

minetest.register_craftitem("foods:jam_blueberry", {
	description = "Blueberry Jam",
	inventory_image = "foods_jam_blueberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "foods:jam_blueberry",
    recipe = {
        {"farming:blueberry", "farming:blueberry", "farming:blueberry"},
        {"farming:blueberry", "farming:blueberry", "farming:blueberry"},
        {"foods:sugar", "vessels:glass_jar", "foods:sugar"}
    }
})

minetest.register_craftitem("foods:jam_grape", {
	description = "Grape Jam",
	inventory_image = "foods_jam_grape.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "foods:jam_grape",
    recipe = {
        {"", "", ""},
        {"farming:grape", "farming:grape", "farming:grape"},
        {"foods:sugar", "vessels:glass_jar", "foods:sugar"}
    }
})

minetest.register_craftitem("foods:jam_huckleberry", {
	description = "Huckleberry Jam",
	inventory_image = "foods_jam_huckleberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "foods:jam_huckleberry",
    recipe = {
        {"farming:huckleberry", "farming:huckleberry", "farming:huckleberry"},
        {"farming:huckleberry", "farming:huckleberry", "farming:huckleberry"},
        {"foods:sugar", "vessels:glass_jar", "foods:sugar"}
    }
})

minetest.register_craftitem("foods:jam_raspberry", {
	description = "Raspberry Jam",
	inventory_image = "foods_jam_raspberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "foods:jam_raspberry",
    recipe = {
        {"farming:raspberry", "farming:raspberry", "farming:raspberry"},
        {"farming:raspberry", "farming:raspberry", "farming:raspberry"},
        {"foods:sugar", "vessels:glass_jar", "foods:sugar"}
    }
})

minetest.register_craftitem("foods:jam_strawberry", {
	description = "Strawberry Jam",
	inventory_image = "foods_jam_strawberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "foods:jam_strawberry",
    recipe = {
        {"farming:strawberry", "farming:strawberry", "farming:strawberry"},
        {"farming:strawberry", "farming:strawberry", "farming:strawberry"},
        {"foods:sugar", "vessels:glass_jar", "foods:sugar"}
    }
})

-- Minced meat
minetest.register_craftitem("foods:minced_meat", {
    description = "Minced Meat",
    inventory_image = "foods_minced_meat.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "foods:minced_meat",
    recipe = {
        {"", "group:food_meat_raw", ""},
        {"", "group:food_meat_raw", ""}
    }
})

-- Paper Bag
minetest.register_craftitem("foods:paper_bag", {
    description = "Paper Bag",
    inventory_image = "foods_paper_bag.png",
})

minetest.register_craft( {
    output = "foods:paper_bag",
    recipe = {
        {"default:paper", "", "default:paper"},
        {"", "default:paper", ""},
    }
})

--Peanut butter
minetest.register_craftitem("foods:peanut_butter", {
    description = "Peanut Butter",
    inventory_image = "foods_peanut_butter.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft( {
    type = "shapeless",
    output = "foods:peanut_butter",
    recipe = {"vessels:glass_jar", "farming:bag_of_peanut", "foods:sugar"},
    replacements = {{"farming:bag_of_peanut", "farming:bag"}}
})

-- Salt
minetest.register_craftitem("foods:salt", {
    description = "Salt",
    inventory_image = "foods_salt.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft( {
    type = "cooking",
    cooktime = 5,
    output = "foods:salt 3",
    recipe = "bucket:bucket_water",
    replacements = {
        {"bucket:bucket_water", "bucket:bucket_empty"}
    }
})

-- Sugar
minetest.register_craftitem("foods:sugar", {
	description = "Sugar",
	inventory_image = "foods_sugar.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:sugar",
	recipe = {"default:reed"}
})

-- Tomato juice
minetest.register_craftitem("foods:tomato_juice", {
	description = "Tomato Juice",
	inventory_image = "foods_tomato_juice.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:tomato_juice",
	recipe = {"farming:tomato", "vessels:glass_bottle"}
})
