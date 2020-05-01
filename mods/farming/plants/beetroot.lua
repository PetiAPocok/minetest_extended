farming.register_plant("farming:beetroot", {
	description = "Beetroot Seed",
	inventory_image = "farming_beetroot_seed.png",
	steps = 5,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:beetroot_soup", {
	--~ description = "Beetroot soop",
	--~ inventory_image = "farming_beetroot_soup.png",
	--~ on_use = minetest.item_eat(8),
--~ })

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_beetroot",
	recipe = {"farming:beetroot"}
})

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:beetroot_soup",
	--~ recipe = {"farming:beetroot", "farming:bowl", "farming:sugar"}
--})

-- make beetroot eatable
minetest.override_item("farming:beetroot", {
    on_use = minetest.item_eat(1),
})

-- Override drop
minetest.override_item("farming:beetroot_5", {
    drop = "farming:beetroot 5"
})
