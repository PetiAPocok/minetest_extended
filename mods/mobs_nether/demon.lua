mobs:register_mob("mobs_nether:demon", {
	type = "monster",
	passive = false,
	attack_type = "dogshoot",
    dogshoot_switch = 1,
	dogshoot_count_max = 12,
	dogshoot_count2_max = 3,
    damage = 5,
    shoot_interval = 2.2,
	arrow = "mobs_nether:shadow_ball",
	shoot_offset = 1,
    reach = 3,
    pathfinding = true,
	hp_min = 4,
	hp_max = 50,
	armor = 100,
	collisionbox = {-0.525,-1.5,-0.525, 0.525,1.2,0.525},
	visual = "mesh",
	mesh = "mobs_nether_demon.b3d",
	drawtype = "front",
	textures = {
		{"mobs_nether_demon.png"},
	},
    visual_size = {x = 1.5, y = 1.5},
	makes_footstep_sound = true,
	sounds = {
        random = "mobs_nether_demon_random",
        damage = "mobs_nether_demon_damage",
        death = "mobs_nether_demon_death",
    },
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "mobs_nether:demon_skin", chance = 2, min = 1, max = 3},
        {name = "mobs_nether:clotted_demon_blood", chance = 2, min = 1, max = 3},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	view_range = 15,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
})

mobs:spawn({
	name = "mobs_nether:demon",
    nodes = {"nether:rack"},
	chance = 1000,
	active_object_count = 1,
    max_light = 5,
    max_heigh = -5000,
	min_height = -32000,
})

mobs:register_egg("mobs_nether:demon", "Demon", "default_coal_block.png", 1)

minetest.register_craftitem("mobs_nether:demon_skin", {
	description = "Demon Skin",
	inventory_image = "mobs_nether_demon_skin.png",
})

minetest.register_craftitem("mobs_nether:clotted_demon_blood", {
	description = "Clotted Demon blood",
	inventory_image = "mobs_nether_clotted_demon_blood.png",
})

-- shadow_ball (weapon)
mobs:register_arrow("mobs_nether:shadow_ball", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"mobs_nether_demon_arrow.png"},
	collisionbox = {-0.1, -0.1, -0.1, 0.1, 0.1, 0.1},
	velocity = 7,
	glow = 5,
	expire = 0.1,

	on_activate = function(self, staticdata, dtime_s)
		-- make fireball indestructable
		self.object:set_armor_groups({immortal = 1, fleshy = 100})
	end,

	-- if player has a good weapon with 7+ damage it can deflect fireball
	on_punch = function(self, hitter, tflp, tool_capabilities, dir)

		if hitter and hitter:is_player() and tool_capabilities and dir then

			local damage = tool_capabilities.damage_groups and
				tool_capabilities.damage_groups.fleshy or 1

			local tmp = tflp / (tool_capabilities.full_punch_interval or 1.4)

			if damage > 6 and tmp < 4 then

				self.object:set_velocity({
					x = dir.x * self.velocity,
					y = dir.y * self.velocity,
					z = dir.z * self.velocity,
				})
			end
		end
	end,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	-- node hit
	hit_node = function(self, pos, node)
		self.object:remove()
	end
})
