mobs:register_mob("mobs_nether:tortured_soul", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	--specific_attack = {"player", "mobs_npc:npc"},
	reach = 2,
	damage = 1,
	hp_min = 4,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.6, 0, -0.6, 0.6, 1.6, 0.6},
	visual = "mesh",
	mesh = "mobs_nether_tortured_soul.obj",
    visual_size = {x = 1, y = 1},
	textures = {
		{"mobs_nether_tortured_soul.png"},
	},
    use_texture_alpha = true,
	blood_texture = "nether_glowstone.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_nether_tortured_soul_random",
	},
	walk_velocity = 1.5,
	run_velocity = 1.5,
	view_range = 8, --15
	fly = true,
	floats = 1,
	drops = {
		{name = "mobs_nether:ectoplasm", chance = 1, min = 2, max = 5},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 1,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 39,
		walk_start = 41,
		walk_end = 72,
		run_start = 74,
		run_end = 105,
		punch_start = 74,
		punch_end = 105,
	},
})

mobs:spawn({
	name = "mobs_nether:tortured_soul",
    nodes = {"nether:rack"},
	chance = 100,
	active_object_count = 10,
    max_light = 5,
    max_heigh = -5000,
	min_height = -32000,
})

mobs:register_egg("mobs_nether:tortured_soul", "Tortured Soul", "nether_glowstone.png", 1)

minetest.register_craftitem("mobs_nether:ectoplasm", {
	description = "Ectoplasm",
	inventory_image = "mobs_nether_ectoplasm.png",
})
