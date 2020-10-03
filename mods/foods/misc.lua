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

-- Honey
minetest.register_craftitem("foods:jar_of_honey", {
	description = "Jar of Honey",
	inventory_image = "foods_jar_of_honey.png"
})

minetest.register_craftitem("foods:wax", {
	description = "Wax",
	inventory_image = "foods_wax.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:jar_of_honey",
    recipe = {"mobs:honey", "vessels:glass_jar"},
    replacements = {
        {"mobs:honey", "foods:wax"}
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
