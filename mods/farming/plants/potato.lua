farming.register_plant("farming:potato", {
	description = "Potato Seed",
	inventory_image = "farming_potato_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

-- Override drop
minetest.override_item("farming:potato_5", {
    drop = {
        items = {
            { items = {"farming:seed_potato"} },
            { items = {"farming:potato 5"} }
        }
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:seed_potato",
    recipe = {"farming:potato", "bucket:bucket_water"},
    replacements = {
        {"bucket:bucket_water", "bucket:bucket_empty"}
    }
})

-- make potato eatable
minetest.override_item("farming:potato", {
    on_use = minetest.item_eat(2)
})

minetest.register_craftitem("farming:potato_baked", {
	description = "Baked Potato",
	inventory_image = "farming_potato_baked.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "farming:potato_baked",
	recipe = "farming:potato"
})

minetest.override_item("farming:potato_5", {
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.35, -0.5, -0.35, 0.35, 0.0, 0.35},
        },
    },
})
