farming.register_plant("farming:cocoa", {
	description = "Cocoa Seed",
	inventory_image = "farming_cocoa_seed.png",
	steps = 6,
	minlight = 10,
	fertility = {"grassland"},
})

-- Change visual scale of the bean plants
for i = 1 , 6 do
	minetest.override_item("farming:cocoa_"..i, {
		drawtype = "plantlike",
		visual_scale = 2.5
	})
end

-- Override drop
minetest.override_item("farming:cocoa_6", {
    drop = "farming:cocoa 7"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_cocoa",
	recipe = {"farming:cocoa"}
})

minetest.override_item("farming:cocoa_6", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.3, -0.5, -0.3, 0.3, 1.5, 0.3},
        },
    },
})
