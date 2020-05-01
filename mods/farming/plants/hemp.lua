farming.register_plant("farming:hemp", {
	description = "Hemp Seed",
	inventory_image = "farming_hemp_seed.png",
	steps = 8,
	minlight = 10,
	fertility = {"grassland"},
})

--~ minetest.register_craftitem("farming:hemp_cake", {
	--~ description = "hemp cake",
	--~ inventory_image = "farming_hemp_cake.png",
	--~ on_use = minetest.item_eat(20),
--~ })

--~ minetest.register_craftitem("farming:hemp_cake_dough", {
	--~ description = "hemp cake dough",
	--~ inventory_image = "farming_hemp_cake_dough.png",
--~ })

-- crafting

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:seed_hemp",
	--~ recipe = {"farming:hemp"}
--~ })

--~ minetest.register_craft({
	--~ type = "shapeless",
	--~ output = "farming:hemp_cake_dough",
	--~ recipe = {"farming:hemp", "farming:flour", "farming:sugar"}
--~ })


--~ minetest.register_craft({
	--~ type = "cooking",
	--~ cooktime = 18,
	--~ output = "farming:hemp_cake",
	--~ recipe = "farming:hemp_cake_dough"
--~ })

--~ -- make hemp eatable
--~ minetest.override_item("farming:hemp", {
    --~ on_use = minetest.item_eat(1),
--~ })

-- Override drop
minetest.override_item("farming:hemp_8", {
	drop = {
		--max_items = 1,
		items = {
			{
				items = {"farming:hemp_seed"},
			},
			{
				items = {"farming:hemp 5"}
			}
		}
	}
})
