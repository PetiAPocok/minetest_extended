-- Bag
minetest.register_craftitem("farming:bag", {
	description = "Bag",
	inventory_image = "farming_bag.png"
})

minetest.register_craft({
    output = "farming:bag",
    recipe = {
        {"farming:string", "", "farming:string"},
        {"farming:string", "", "farming:string"},
        {"farming:string", "farming:string", "farming:string"}
    }
})

-- Bowl
minetest.register_craftitem("farming:bowl", {
	description = "Bowl",
	inventory_image = "farming_bowl.png"
})

minetest.register_craft({
    output = "farming:bowl 2",
    recipe = {
        {"group:wood", "", "group:wood"},
        {"", "group:wood", ""},
    }
})

-- Pot
minetest.register_craftitem("farming:pot", {
	description = "Pot",
	inventory_image = "farming_pot.png"
})

minetest.register_craft({
    output = "farming:pot 2",
    recipe = {
        {"default:tin_ingot", "", "default:tin_ingot"},
        {"default:tin_ingot", "", "default:tin_ingot"},
        {"", "default:tin_ingot", ""}
    }
})

-- Flour
minetest.register_craftitem("farming:flour", {
	description = "Flour",
	inventory_image = "farming_flour.png",
	groups = {food_flour = 1, flammable = 1},
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:flour",
    recipe = {"farming:wheat", "farming:wheat", "farming:wheat", "default:paper"}
})

-- Jams
minetest.register_craftitem("farming:jam_ananas", {
	description = "Ananas Jam",
	inventory_image = "farming_jam_ananas.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "farming:jam_ananas",
    recipe = {
        {"", "", ""},
        {"", "farming:ananas", ""},
        {"farming:sugar", "vessels:glass_jar", "farming:sugar"}
    }
})

minetest.register_craftitem("farming:jam_blueberry", {
	description = "Blueberry Jam",
	inventory_image = "farming_jam_blueberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "farming:jam_blueberry",
    recipe = {
        {"farming:blueberry", "farming:blueberry", "farming:blueberry"},
        {"farming:blueberry", "farming:blueberry", "farming:blueberry"},
        {"farming:sugar", "vessels:glass_jar", "farming:sugar"}
    }
})

minetest.register_craftitem("farming:jam_grape", {
	description = "Grape Jam",
	inventory_image = "farming_jam_grape.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "farming:jam_grape",
    recipe = {
        {"", "", ""},
        {"farming:grape", "farming:grape", "farming:grape"},
        {"farming:sugar", "vessels:glass_jar", "farming:sugar"}
    }
})

minetest.register_craftitem("farming:jam_huckleberry", {
	description = "Huckleberry Jam",
	inventory_image = "farming_jam_huckleberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "farming:jam_huckleberry",
    recipe = {
        {"farming:huckleberry", "farming:huckleberry", "farming:huckleberry"},
        {"farming:huckleberry", "farming:huckleberry", "farming:huckleberry"},
        {"farming:sugar", "vessels:glass_jar", "farming:sugar"}
    }
})

minetest.register_craftitem("farming:jam_raspberry", {
	description = "Raspberry Jam",
	inventory_image = "farming_jam_raspberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "farming:jam_raspberry",
    recipe = {
        {"farming:raspberry", "farming:raspberry", "farming:raspberry"},
        {"farming:raspberry", "farming:raspberry", "farming:raspberry"},
        {"farming:sugar", "vessels:glass_jar", "farming:sugar"}
    }
})

minetest.register_craftitem("farming:jam_strawberry", {
	description = "Strawberry Jam",
	inventory_image = "farming_jam_strawberry.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "farming:jam_strawberry",
    recipe = {
        {"", "", ""},
        {"farming:strawberry", "farming:strawberry", "farming:strawberry"},
        {"farming:sugar", "vessels:glass_jar", "farming:sugar"}
    }
})

-- Minced meat
minetest.register_craftitem("farming:minced_meat", {
    description = "Minced Meat",
    inventory_image = "farming_minced_meat.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    output = "farming:minced_meat",
    recipe = {
        {"", "group:food_meat_raw", ""},
        {"", "group:food_meat_raw", ""}
    }
})

-- Paper Bag
minetest.register_craftitem("farming:paper_bag", {
    description = "Paper Bag",
    inventory_image = "farming_paper_bag.png",
})

minetest.register_craft( {
    output = "farming:paper_bag",
    recipe = {
        {"default:paper", "", "default:paper"},
        {"", "default:paper", ""},
    }
})

--Peanut butter
minetest.register_craftitem("farming:peanut_butter", {
    description = "Peanut Butter",
    inventory_image = "farming_peanut_butter.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft( {
    type = "shapeless",
    output = "farming:peanut_butter",
    recipe = {"vessels:glass_jar", "farming:bag_of_peanut", "farming:sugar"},
})

-- Salt
minetest.register_craftitem("farming:salt", {
    description = "Salt",
    inventory_image = "farming_salt.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft( {
    type = "cooking",
    cooktime = 5,
    output = "farming:salt 3",
    recipe = "bucket:bucket_water",
    replacements = {
        {"bucket:bucket_water", "bucket:bucket_empty"}
    }
})

minetest.register_craft({
	output = "farming:string",
	recipe = {
		{"farming:hemp", "farming:hemp", "farming:hemp"}
	}
})

-- Sugar
minetest.register_craftitem("farming:sugar", {
	description = "Sugar",
	inventory_image = "farming_sugar.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:sugar",
	recipe = {"default:reed"}
})

minetest.register_craft({
	output = "wool:white",
	recipe = {
		{"farming:string", "farming:string", "farming:string"},
		{"farming:string", "farming:string", "farming:string"},
        {"farming:string", "farming:string", "farming:string"}
	}
})
