farming.register_plant("farming:cotton", {
	description = "Cotton Seed",
	harvest_description = "Cotton",
	inventory_image = "farming_cotton_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland", "desert"},
	groups = {flammable = 4},
})

-- Override drop
minetest.override_item("farming:cotton_8", {
	drop = "farming:cotton 3"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_cotton 2",
	recipe = {"farming:cotton"}
})

minetest.register_craftitem("farming:string", {
	description = "String",
	inventory_image = "farming_string.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:string 2",
	recipe = {
		{"farming:cotton"},
		{"farming:cotton"},
	}
})

minetest.register_craft({
	output = "wool:white",
	recipe = {
		{"farming:cotton", "farming:cotton"},
		{"farming:cotton", "farming:cotton"},
	}
})

minetest.register_craft({
	output = "wool:white",
	recipe = {
		{"farming:string", "farming:string", "farming:string"},
		{"farming:string", "farming:string", "farming:string"},
        {"farming:string", "farming:string", "farming:string"}
	}
})
