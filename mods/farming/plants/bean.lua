farming.register_plant("farming:bean", {
	description = "Bean Seed",
	inventory_image = "farming_bean_seed.png",
	steps = 6,
	minlight = 10,
	fertility = {"grassland"},
})

-- Change visual scale of the bean plants
for i = 1 , 6 do
	minetest.override_item("farming:bean_"..i, {
		drawtype = "plantlike",
		visual_scale = 1.5 ,
	})
end

-- Override drop
minetest.override_item("farming:bean_6", {
    drop = "farming:bean 50"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_bean",
	recipe = {"farming:bean", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

minetest.registered_items["farming:bean"].groups.sackable = 1


minetest.override_item("farming:bean_6", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.3, -0.5, -0.3, 0.3, 1.0, 0.3},
        },
    },
})
