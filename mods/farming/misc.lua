minetest.register_craft({
	output = "farming:string",
	recipe = {
		{"farming:hemp", "farming:hemp", "farming:hemp"}
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
