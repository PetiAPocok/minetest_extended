minetest.register_craftitem("foods:milkshake_blueberry", {
	description = "Blueberry Milkshake",
	inventory_image = "foods_milkshake_blueberry.png",
	on_use = minetest.item_eat(4, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:milkshake_blueberry 3",
	recipe = {"foods:jam_blueberry", "mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("foods:cocoa_drink", {
    description = "Cocoa Drink",
    inventory_image = "foods_cocoa_drink.png",
    on_use = minetest.item_eat(2, "vessels:glass_jar"),
})

minetest.register_craft({
    type = "shapeless",
    output = "foods:cocoa_drink 3",
    recipe = {"mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar", "vessels:glass_jar", "foods:chocolate"},
    replacements = {
        {"mobs:bucket_milk", "bucket:bucket_empty"}
    }
})

minetest.register_craftitem("foods:milkshake_raspberry", {
	description = "Raspberry Milkshake",
	inventory_image = "foods_milkshake_raspberry.png",
	on_use = minetest.item_eat(2, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:milkshake_raspberry 3",
	recipe = {"foods:jam_raspberry", "mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

minetest.register_craftitem("foods:milkshake_strawberry", {
	description = "Strawberry Milkshake",
	inventory_image = "foods_milkshake_strawberry.png",
	on_use = minetest.item_eat(2, "vessels:glass_jar"),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:milkshake_strawberry 3",
	recipe = {"foods:jam_strawberry", "mobs:bucket_milk", "vessels:glass_jar", "vessels:glass_jar"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})
