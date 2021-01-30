farming.register_plant("farming:huckleberry", {
	description = "Huckleberry Seeds",
	inventory_image = "farming_huckleberry_seeds.png",
	steps = 5,
	minlight = 12,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
})

-- Change Drawtype of the plants
for i = 3 , 5 do
	minetest.override_item("farming:huckleberry_"..i, {
		drawtype = "mesh",
		mesh = "farming_huckleberry_bush.obj",
	})
end

minetest.override_item("farming:huckleberry_2", {
	drawtype = "mesh",
	mesh = "farming_huckleberry_bush_2.obj",
})

-- Override drop
minetest.override_item("farming:huckleberry_5", {
	drawtype = "mesh",
	mesh = "farming_huckleberry_bush.obj",
	drop = "farming:huckleberry 3"
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_huckleberry",
	recipe = {"farming:huckleberry"}
})

-- make huckleberry eatable
minetest.override_item("farming:huckleberry", {
	on_use = minetest.item_eat(1),
})

minetest.override_item("farming:huckleberry_5", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.45, -0.5, -0.45, 0.45, 0.2, 0.45},
        },
    },
})
