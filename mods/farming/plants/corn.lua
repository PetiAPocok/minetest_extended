farming.register_plant("farming:corn", {
	description = "Corn Seeds",
	inventory_image = "farming_corn_seed.png",
	steps = 8,
	minlight = 12,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
})

-- Change visual scale of the corn plants
for i = 1 , 8 do
	minetest.override_item("farming:corn_"..i, {
		drawtype = "plantlike",
		visual_scale = 1.5 ,
	})
end

-- Override drop
minetest.override_item("farming:corn_8", {
	drop = "farming:corn 8"
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:seed_corn 10",
    recipe = {"farming:corn"}
})

minetest.register_craftitem("farming:corn_boiled", {
	description = "Boiled Corn",
	inventory_image = "farming_corn_boiled.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 14,
	output = "farming:corn_boiled",
	recipe = "farming:corn"
})

minetest.override_item("farming:corn_8", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.25, -0.5, -0.25, 0.25, 1.0, 0.25},
        },
    },
})
