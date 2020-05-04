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

-- Minced meat
minetest.register_craftitem("farming:minced_meat", {
    description = "Minced Meat",
    inventory_image = "farming_minced_meat.png",
    on_use = minetest.item_eat(-1)
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:sugar",
    recipe = {"default:reed"}
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
