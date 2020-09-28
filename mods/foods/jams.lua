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
