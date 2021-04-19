minetest.register_craftitem("accessories:braclet_gold", {
	description = "Gold Braclet",
	inventory_image = "accessories_braclet_gold.png",
    stack_max = 1,
    groups = {braclet = 1}
})

minetest.register_craft({
	output = "accessories:braclet_gold",
	recipe = {
		{"amethyst:amethyst", "amethyst:amethyst"},
		{"amethyst:amethyst", "amethyst:amethyst"}
	}
})


minetest.register_craftitem("accessories:earring_gold", {
	description = "Gold Earring",
	inventory_image = "accessories_earring_gold.png",
    stack_max = 1,
    groups = {earring = 1}
})


minetest.register_craftitem("accessories:necklace_gold", {
	description = "Gold Necklace",
    inventory_image = "accessories_necklace_gold.png",
    stack_max = 1,
    groups = {necklace = 1}
})


minetest.register_craftitem("accessories:ring_gold", {
	description = "Gold Ring",
	inventory_image = "accessories_ring_gold.png",
    stack_max = 1,
    groups = {ring = 1}
})
