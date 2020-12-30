mobs:register_mob("mobs_nether:skeleton", {
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
	collisionbox = {-0.4, 0, -0.4, 0.4, 1.7, 0.4},
	visual = "mesh",
	mesh = "mobs_nether_skeleton.b3d",
	textures = {
		{"mobs_nether_skeleton.png"},
	},
	blood_texture = "default_silver_sand.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_nether_skeleton_random",
        hurt = "mobs_nether_skeleton_hurt",
        death = "mobs_nether_skeleton_death",
	},
	walk_velocity = 1.5,
	run_velocity = 4,
	view_range = 8, --15
	jump = true,
	floats = 0,
	drops = {
		{name = "bones:bone", chance = 1, min = 2, max = 5},
	},
	water_damage = 0,
	lava_damage = 4,
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
	name = "mobs_nether:skeleton",
    nodes = {"nether:rack"},
	chance = 100,
	active_object_count = 10,
    max_heigh = -5000,
	min_height = -32000,
})

mobs:register_egg("mobs_nether:skeleton", "Skeleton", "default_silver_sand.png", 1)
