minetest.register_craftitem("foods:jelly_ananas", {
	description = "Ananas Jelly",
	inventory_image = "foods_jelly_ananas.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:jelly_ananas",
	recipe = {"foods:jam_ananas", "bones:gelatin_powder"},
    replacements = {
		{"foods:jam_ananas", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jelly_blueberry", {
	description = "Blueberry Jelly",
	inventory_image = "foods_jelly_blueberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:jelly_blueberry",
	recipe = {"foods:jam_blueberry", "bones:gelatin_powder"},
    replacements = {
		{"foods:jam_blueberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jelly_grape", {
	description = "Grape Jelly",
	inventory_image = "foods_jelly_grape.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:jelly_grape",
	recipe = {"foods:jam_grape", "bones:gelatin_powder"},
    replacements = {
		{"foods:jam_grape", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jelly_huckleberry", {
	description = "Huckleberry Jelly",
	inventory_image = "foods_jelly_huckleberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:jelly_huckleberry",
	recipe = {"foods:jam_huckleberry", "bones:gelatin_powder"},
    replacements = {
		{"foods:jam_huckleberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jelly_raspberry", {
	description = "Raspberry Jelly",
	inventory_image = "foods_jelly_raspberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:jelly_raspberry",
	recipe = {"foods:jam_raspberry", "bones:gelatin_powder"},
    replacements = {
		{"foods:jam_raspberry", "vessels:glass_jar"}
	}
})

minetest.register_craftitem("foods:jelly_strawberry", {
	description = "Strawberry Jelly",
	inventory_image = "foods_jelly_strawberry.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "foods:jelly_strawberry",
	recipe = {"foods:jam_strawberry", "bones:gelatin_powder"},
    replacements = {
		{"foods:jam_strawberry", "vessels:glass_jar"}
	}
})
