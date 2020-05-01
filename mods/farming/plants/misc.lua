-- Sugar
minetest.register_craftitem("farming:sugar", {
	description = "Sugar",
	inventory_image = "farming_sugar.png",
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
})

minetest.register_craft( {
	type = "cooking",
	cooktime = 5,
	output = "farming:salt 3",
	recipe = "bucket:bucket_water",
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	},
})
