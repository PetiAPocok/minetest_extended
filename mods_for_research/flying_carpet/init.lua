local S = minetest.get_translator("flying_carpet")

--
-- Helper functions
--

local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i/math.abs(i)
	end
end

local function get_velocity(v, yaw, y)
	local x = math.cos(yaw)*v
	local z = math.sin(yaw)*v
	return {x=x, y=y, z=z}
end

local function get_v(v)
	return math.sqrt(v.x^2+v.z^2)
end

local function get_v3(v)
	return math.sqrt(v.x^2+v.y^2+v.z^2)
end

local function magic_particle(object, texture)
	local src = object:get_pos()
	local velo = object:get_velocity()
	velo = vector.multiply(velo, 0.1)
	if texture == nil then texture = "flying_carpet_magic_smoke.png" end
	return minetest.add_particlespawner({
		amount = 50,
		time = 1,
		minpos = {x=src.x-1.5, y=src.y-0.03, z=src.z-1.5},
		maxpos = {x=src.x+1.5, y=src.y+0.03, z=src.z+1.},
		minvel = {x=velo.x-0.4, y=velo.y-0.1, z=velo.z-0.4},
		maxvel = {x=velo.x+0.4, y=velo.y+0.1, z=velo.z+0.4},
		minexptime=4.5,
		maxexptime=6,
		minsize=1,
		maxsize=1.25,
		texture = texture,
	})
end

local function death_particles(object)
	local src = object:get_pos()
	local yaw = object:get_yaw()
	minetest.add_particlespawner({
		amount = 50,
		time = 0.1,
		minpos = {x=src.x-1, y=src.y-0.02, z=src.z-1},
		maxpos = {x=src.x+1, y=src.y+0.02, z=src.z+1},
		minvel = {x=-0.01, y=0, z=0.01},
		maxvel = {x=0.01, y=0, z=0.01},
		minexptime=4.5,
		maxexptime=6,
		minsize=1.5,
		maxsize=1.5,
		texture = "flying_carpet_death.png",
	})
end

--
-- Initialization
--

local mana_regen_cost = 1.5

local mod_model = minetest.get_modpath("player_api") ~= nil
local mod_mana = minetest.get_modpath("mana") ~= nil
local mod_craft = minetest.get_modpath("default") ~= nil and minetest.get_modpath("wool")
local mod_craft_mcl2 = minetest.get_modpath("mcl_core") and minetest.get_modpath("mcl_wool") and minetest.get_modpath("mesecons_torch")
local mod_doc_items = minetest.get_modpath("doc_items") ~= nil
local mod_doc_identifier = minetest.get_modpath("doc_identifier") ~= nil

--
-- Carpet entity
--

local init_velocities = function()
	local ret = {}
	for i=1,50 do
		table.insert(ret,{x=0,y=0,z=0})
	end
	return ret
end

local update_velocities = function(velocities, new_value)
	table.insert(velocities, 1, new_value)
	table.remove(velocities, 51)
	return velocities
end

local carpet = {
	physical = true,
	collide_with_objects = false,
	collisionbox = {-1,-0.02,-1, 1,0.02,1},
	visual = "mesh",
	mesh = "flying_carpet_model.obj",
	textures = {"flying_carpet_surface.png"},

	driver = nil,		-- Attached player object
	v = 0,			-- Velocity on the horizontal plane
	h = 0,			-- Velocity on the vertical plane (height speed)
	falling = false,	-- Fall mode: Carpet falls down and can't be controlled
	flying = false,		-- If it is in fly mode
	prefly = true,		-- Prefly mode: Carpet has been placed and waits to be boarded
	starttimer = 0,		-- Time in seconds since the flight has been started
	weartimer = 0,		-- Timer to apply wear for flying
	viscosity = 0,		-- Viscosity of node in which the carpet is in (no liquid = 0)
	wear = 0,		-- Damage / wear of carpet, corresponds to tool wear
	sound_slide = nil,	-- Sound handle for sliding loop
	sound_flight = nil,	-- Sound handle for flight loop
	sound_death_warning=nil, -- Sound handle for flight loop with high damage
	slidepos = nil,		-- Position of nearby node which has been checked for sliding
	slidenode = nil,	-- Node definition of nearby node which has been checked for sliding
	liquidpos = nil,	-- Position of nearby node which has been checked for being a liquid
	liquidnode = nil,	-- Node definition of nearby node which has been checked for being a liquid
	past_velocities = init_velocities(),	-- List of recent velocities
	past_diff = 0,		-- Difference of the past two velocities, used to deal collision damage to player
	last_damage = nil,	-- How much damage has been dealt to the player in the last step
	last_particle = 1,	-- Particle spawning timer
}

-- Rightclick allows to attach and detach to/from carpet
function carpet:on_rightclick(clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	local name = clicker:get_player_name()
	-- Detach attached player
	if self.driver and clicker == self.driver then
		self.driver = nil
		clicker:set_detach()
		if mod_model then
			player_api.player_attached[name] = false
			player_api.set_animation(clicker, "stand", 30)
		end
		if mod_mana and self.flying then
			mana.setregen(clicker:get_player_name(), mana.getregen(clicker:get_player_name())+mana_regen_cost)
			clicker:get_meta():set_int("flying_carpet:mana_cost", 0)
		end
	-- Attach player (must be unoccupied and slow)
	elseif not self.driver and clicker:get_attach() == nil and ((self.v < 0.5 and math.abs(self.h) < 1) or self.prefly) then
		self.driver = clicker
		clicker:set_look_horizontal(self.object:get_yaw()-math.pi/2)
		clicker:set_attach(self.object, "", {x=-4,y=0.3,z=0}, {x=0,y=90,z=0})
		if mod_model then
			player_api.player_attached[name] = true
			minetest.after(0.2, function(player)
				if player and player:is_player() then
					player_api.set_animation(player, "sit", 30)
				end
			end, clicker)
		end
		if mod_mana and (self.flying or self.prefly) then
			mana.setregen(clicker:get_player_name(), mana.getregen(clicker:get_player_name())-mana_regen_cost)
			clicker:get_meta():set_int("flying_carpet:mana_cost", 1)
		end
		if self.prefly then
			self.flying = true
			self.falling = false
			self.prefly = false
			self.object:set_velocity(get_velocity(4, self.object:get_yaw(), 0))
		end
	end
end

function carpet:on_activate(staticdata, dtime_s)
	self.object:set_armor_groups({fabric=100})
	if staticdata ~= nil and staticdata ~= "" then
		local data = minetest.deserialize(staticdata)
		if data then
			self.v = data.v
			self.h = data.h
			self.falling = data.falling
			self.flying = data.flying
			self.prefly = data.prefly
			self.viscosity = data.viscosity
			self.wear = data.wear
		else
			minetest.log("error", "[flying_carpet] carpet:on_activate: deserialized data was nil!")
			return
		end
	end
end

function carpet:get_staticdata()
	if self.sound_flight then
		minetest.sound_stop(self.sound_flight)
		self.sound_flight = nil
	end
	if self.sound_slide then
		minetest.sound_stop(self.sound_slide)
		self.sound_slide = nil
	end
	if self.sound_death_warning then
		minetest.sound_stop(self.sound_death_warning)
		self.sound_death_warning = nil
	end
	local data = {}
	data.v = self.v
	data.h = self.h
	data.falling = self.falling
	data.flying = self.flying
	data.prefly = self.prefly
	data.viscosity = self.viscosity
	data.wear = self.wear
	return minetest.serialize(data)
end

-- Stop flying or collect carpet on punching it
function carpet:on_punch(puncher, time_from_last_punch, tool_capabilities, direction)
	if puncher and puncher:is_player() then
		-- Owner of flying carpet punches
		if (self.driver == puncher and self.flying) then
			-- Go into falling mode immediately
			minetest.sound_play("flying_carpet_out_of_energy", {pos = self.object:get_pos(), gain=0.7})
			magic_particle(self.object)
			if mod_mana then
				mana.setregen(puncher:get_player_name(), mana.getregen(puncher:get_player_name())+mana_regen_cost)
				puncher:get_meta():set_int("flying_carpet:mana_cost", 0)
			end
			self.falling = true
			self.flying = false
			if self.sound_flight then
				minetest.sound_stop(self.sound_flight)
				self.sound_flight = nil
			end
			if self.sound_death_warning then
				minetest.sound_stop(self.sound_death_warning)
				self.sound_death_warning = nil
			end
		-- Someone punches slow non-flying carpet
		elseif (self.driver == nil or self.driver == puncher) and (self.v < 1 and math.abs(self.h) < 1) and not self.flying then
			-- Collect carpet
			local carpetitem = ItemStack("flying_carpet:carpet")
			carpetitem:set_wear(self.wear)
			local inv = puncher:get_inventory()
			if not minetest.settings:get_bool("creative_mode") or not inv:contains_item("main", "flying_carpet:carpet") then
				local leftover = inv:add_item("main", carpetitem)
				-- Put item into world if no space in inventory
				if not leftover:is_empty() then
					minetest.add_item(self.object:get_pos(), leftover)
				end
			end
			minetest.sound_play("flying_carpet_take", {pos=self.object:get_pos(), gain=0.3})
			puncher:set_detach()
			if mod_model then
				player_api.player_attached[puncher:get_player_name()] = false
			end
			if self.sound_flight then
				minetest.sound_stop(self.sound_flight)
				self.sound_flight = nil
			end
			if self.sound_death_warning then
				minetest.sound_stop(self.sound_death_warning)
				self.sound_death_warning = nil
			end
			if self.sound_slide then
				minetest.sound_stop(self.sound_slide)
				self.sound_slide = nil
			end
			self.object:remove()
		end
	end
end

function carpet:on_step(dtime)
	if not self.prefly then

	self.v = get_v(self.object:get_velocity())*get_sign(self.v)
	self.h = self.object:get_velocity().y

	local spawn_particles
	self.last_particle = self.last_particle + 0.1
	if self.last_particle > 0.1 then
		spawn_particles = true
		self.last_particle = 0
	else
		spawn_particles = false
	end

	-- check for big recent changes in speed, (likely caused by collisions)
	self.past_velocities = update_velocities(self.past_velocities, self.object:get_velocity())
	local avg = {x=0,y=0,z=0}
	for i=1,#self.past_velocities do
		avg.x = avg.x + self.past_velocities[i].x
		avg.y = avg.y + self.past_velocities[i].y
		avg.z = avg.z + self.past_velocities[i].z
	end
	avg.x = avg.x/#self.past_velocities
	avg.y = avg.y/#self.past_velocities
	avg.z = avg.z/#self.past_velocities

	local v3_avg = get_v3(avg)
	local v3 = get_v3(self.object:get_velocity())

	local diff = math.abs(v3_avg - v3)

	if not minetest.settings:get_bool("creative_mode") then
		if self.last_damage ~= nil then
			self.last_damage = self.last_damage + dtime
		end

		if self.last_damage == nil or self.last_damage > 1 then
			-- hurt the driver if there was a large recent speed change
			if self.driver and diff >= 9 and diff > self.past_diff then
				-- ... but don't hurt the driver too many times in a row accidentally
				self.driver:set_hp(self.driver:get_hp() - math.floor(diff - 9))
				self.last_damage = 0
			end
			-- damage the carpet if there was a large recent speed change
			if diff >= 6 and diff > self.past_diff then
				-- ... but don't damage the carpet too many times in a row accidentally
				self.wear = self.wear + math.floor((diff - 6)*700)
				self.last_damage = 0
			end
		end
	end

	self.past_diff = diff

	if self.flying then
		if not minetest.settings:get_bool("creative_mode") then
			-- Add wear for flying
			self.weartimer = self.weartimer + dtime
			-- This allows a flight of roughly 12 hours until the maximum wear of 65535 is reached
			local add_wear_at = 0.32959
			if(self.weartimer > add_wear_at) then
				self.wear = self.wear + math.floor((self.weartimer / add_wear_at))
				self.weartimer = self.weartimer % add_wear_at
			end
		end

		if self.driver then
			local ctrl = self.driver:get_player_control()
			if ctrl.up then
				-- Viscosity penalty
				local vpenalty = 2 + self.viscosity
				self.v = self.v + 0.1 / vpenalty
			end
			if ctrl.down then
				self.v = self.v-0.08
			end
			if ctrl.left then
				self.object:set_yaw(self.object:get_yaw()+math.pi/600+dtime*math.pi/600)
			end
			if ctrl.right then
				self.object:set_yaw(self.object:get_yaw()-math.pi/600-dtime*math.pi/600)
			end
			if ctrl.jump then
				if self.v >= 6 then
					self.h = self.h+0.02
				end
			end
			if ctrl.sneak then
				if self.v >= 6 then
					self.h = self.h-0.03
				end
			end

			if mod_mana then
				if mana.getregen(self.driver:get_player_name()) < 0 and mana.get(self.driver:get_player_name()) == 0 then
					minetest.sound_play("flying_carpet_out_of_energy", {pos = self.object:get_pos(), gain=0.7})
					magic_particle(self.object)
					self.falling = true
					self.flying = false
					mana.setregen(self.driver:get_player_name(), mana.getregen(self.driver:get_player_name())+mana_regen_cost)
					self.driver:get_meta():set_int("flying_carpet:mana_cost", 0)
					if self.sound_flight then
						minetest.sound_stop(self.sound_flight)
						self.sound_flight = nil
					end
					if self.sound_death_warning then
						minetest.sound_stop(self.sound_death_warning)
						self.sound_death_warning = nil
					end
				end
			end

			-- Harsh speed penalty for being in a liquid with viscosity > 0
			local vpenalty = 0.09 * self.viscosity
			if self.v > 15 then
				self.v = 15
				self.v = self.v - 0.02 - vpenalty
			elseif self.v > 12 then
				self.v = self.v - 0.02 - vpenalty
			elseif self.v < 6 then
				self.v = self.v + 0.06 - vpenalty
			elseif self.v < 9 then
				self.v = self.v + 0.04 - vpenalty
			elseif self.v < 12 then
				self.v = self.v + 0.02 - vpenalty
			end

		else
			-- Harsh speed penalty for being in a liquid with viscosity > 0
			local vpenalty = 0.09 * self.viscosity
			-- Slow down flying carpet if no player is attached
			self.v = self.v - 0.025 - vpenalty
		end
		if self.v > 3 and self.flying then
			if spawn_particles then
				local star
				if self.v > 7.5 then
					star = "flying_carpet_star.png"
				else
					star = "flying_carpet_star_warning.png"
				end
				local src = self.object:get_pos()
				local velo = self.object:get_velocity()
				-- Speed indicator particles
				minetest.add_particlespawner({
					amount = math.ceil(math.min(3,math.max(0,self.v+3))),
					time = 0.1,
					minpos = {x=src.x-0.6, y=src.y-0.02, z=src.z-0.6},
					maxpos = {x=src.x+0.6, y=src.y-0.02, z=src.z+0.6},
					minvel = {x=velo.x*0.01,y=velo.y*0.01,z=velo.z*0.01},
					maxvel = {x=velo.x*0.01,y=velo.y*0.01,z=velo.z*0.01},
					minexptime=1.8,
					maxexptime=2.2,
					minsize=1,
					maxsize=1.25,
					texture = star,
				})
				-- Death warning particles
				if not minetest.settings:get_bool("creative_mode") and self.wear > 58499 then
					minetest.add_particlespawner({
						--[[ More speed and more wear = more particles.
						Carefully adjusted to roughly match the number of speed indicator particles
						At near full wear, the number of death warning particles should be equal
						to the number of speed indicator particles ]]
						amount = math.ceil(math.min(3,math.max(0,(self.v+3)/(18-(self.wear-58499)/391)))),
						time = 0.1,
						minpos = {x=src.x-0.6, y=src.y-0.06, z=src.z-0.6},
						maxpos = {x=src.x+0.6, y=src.y-0.06, z=src.z+0.6},
						minvel = {x=velo.x*0.005,y=velo.y*0.005,z=velo.z*0.005},
						maxvel = {x=velo.x*0.005,y=velo.y*0.005,z=velo.z*0.005},
						minexptime=5,
						maxexptime=7,
						minsize=1,
						maxsize=1.25,
						texture = "flying_carpet_star_death_warning.png"
					})
				end
			end
			if not self.sound_flight then
				self.sound_flight = minetest.sound_play("flying_carpet_flight", {object = self.object, gain = 0.6, max_hear_distance = 16, loop = true })
			end
			if not minetest.settings:get_bool("creative_mode") and self.wear > 64624 and not self.sound_death_warning then
				self.sound_death_warning = minetest.sound_play("flying_carpet_death_warning", {object = self.object, gain = 0.2, max_hear_distance = 24, loop = true })
			end
		else
			if self.sound_flight then
				minetest.sound_stop(self.sound_flight)
				self.sound_flight = nil
			end
			if self.sound_death_warning then
				minetest.sound_stop(self.sound_death_warning)
				self.sound_death_warning = nil
			end
		end
	end

	local sh = get_sign(self.h)

	local op = self.object:get_pos()
	local ps = table.copy(op)
	ps.y = ps.y-1
	local n
	if self.slidepos ~= nil and vector.equals(vector.round(ps), self.slidepos) then
		n = self.slidenode
	else
		n = minetest.get_node(ps)
		self.slidepos = vector.round(ps)
		self.slidenode = n
	end
	if n.name ~= "ignore" and n.name ~= "air" and n.name ~= nil then
		local comma = ps.y - math.floor(ps.y)
		if minetest.registered_nodes[n.name].walkable and self.h < 0.001 and comma > 0.519 and comma < 0.53 then
			self.v = self.v - 0.2
			if minetest.settings:get_bool("creative_mode") and self.v > 6 then
				-- Apply a small wear for sliding
				self.wear = self.wear + math.floor(self.v)
			end

			if spawn_particles then
				local src = self.object:get_pos()
				local velo = self.object:get_velocity()
				minetest.add_particlespawner({
					amount = math.ceil(math.min(10,math.max(0,self.v))),
					time = 1,
					minpos = {x=src.x-0.6, y=src.y-0.02, z=src.z-0.6},
					maxpos = {x=src.x+0.6, y=src.y-0.02, z=src.z+0.6},
					minvel = {x=-velo.x*0.01-0.1, y=velo.y*0.05+0.01, z=-velo.z*0.01-0.1},
					maxvel = {x=-velo.x*0.01+0.1, y=velo.y*0.05+0.05, z=-velo.z*0.01+0.1},
					minexptime=10,
					maxexptime=15,
					minsize=1,
					maxsize=1.25,
					texture = "flying_carpet_smoke.png",
				})
			end
			if self.v > 1 and not self.sound_slide then
				self.sound_slide = minetest.sound_play("flying_carpet_slide", {object = self.object, gain = 0.5, max_hear_distance = 24, loop = true })
			elseif self.v <= 1 and self.sound_slide then
				minetest.sound_stop(self.sound_slide)
				self.sound_slide = nil
			end
		elseif self.sound_slide then
			minetest.sound_stop(self.sound_slide)
			self.sound_slide = nil
		end
	elseif self.sound_slide then
		minetest.sound_stop(self.sound_slide)
		self.sound_slide = nil
	end

	local pl = table.copy(op)
	pl.y = pl.y-0.3
	if self.liquidpos ~= nil and vector.equals(vector.round(pl), self.liquidpos) then
		n = self.liquidnode
	else
		n = minetest.get_node(pl)
		self.liquidpos = vector.round(pl)
		self.liquidnode = n
	end

	local ndef = minetest.registered_nodes[n.name]
	if ndef.liquidtype ~= "none" then
		if self.h < 0.1 then
			self.h = self.h + 0.05
			self.viscosity = ndef.liquid_viscosity
		end
	else
		self.viscosity = 0
	end

	self.starttimer = self.starttimer + dtime

	if (self.v < 6 and self.starttimer >= 5) or (self.v < 0.5 and self.starttimer >= 0.5) then
		if self.falling == false then
			minetest.sound_play("flying_carpet_out_of_energy", {pos = self.object:get_pos(), gain=0.7})
			self.falling = true
			self.flying = false
			if mod_mana and self.driver ~= nil then
				mana.setregen(self.driver:get_player_name(), mana.getregen(self.driver:get_player_name())+mana_regen_cost)
				self.driver:get_meta():set_int("flying_carpet:mana_cost", 0)
			end
			magic_particle(self.object)
			if self.sound_flight then
				self.sound_flight = minetest.sound_stop(self.sound_flight)
				self.sound_flight = nil
			end
			if self.sound_death_warning then
				self.sound_death_warning = minetest.sound_stop(self.sound_death_warning)
				self.sound_death_warning = nil
			end
			self.v = self.v - 0.04
		end
	else
		if self.h > 0.01 then
			self.h = self.h - 0.005
		elseif self.h < 0.01 then
			self.h = self.h + 0.005
		end
		if math.abs(self.h) > 1 then
			self.h = 1*sh
		end
		if math.abs(self.h) < 0.01 then
			self.h = 0
		end
	end


	if self.v < 0 then
		self.v = 0
	end

	local y
	if self.falling then
		y = self.object:get_velocity().y
		if self.viscosity > 0 then
			local vpenalty = 0.09 * self.viscosity
			self.v = self.v - 0.06 - vpenalty

			self.object:set_acceleration({x=0,y=0,z=0})
			local v_ref = -0.4 / self.viscosity
			local dampen = 1.2
			if(math.abs(y-v_ref) < (dampen+0.01)*self.viscosity) then
				y = v_ref
			else
				if(y>v_ref) then
					y = y - dampen*self.viscosity
				else
					y = y + dampen*self.viscosity
				end
			end
		else
			self.object:set_acceleration({x=0,y=-tonumber(minetest.settings:get("movement_gravity")),z=0})
		end
	else
		y = self.h
		self.object:set_acceleration({x=0,y=0,z=0})
	end
	self.object:set_velocity(get_velocity(self.v, self.object:get_yaw(), y))

	end

	-- Check wear
	if minetest.settings:get_bool("creative_mode") and self.wear >= 65535 then
		-- Destroy carpet if it took to much damage
		death_particles(self.object)
		if self.sound_flight then
			minetest.sound_stop(self.sound_flight)
			self.sound_flight = nil
		end
		if self.sound_death_warning then
			minetest.sound_stop(self.sound_death_warning)
			self.sound_death_warning = nil
		end
		if self.sound_slide then
			minetest.sound_stop(self.sound_slide)
			self.sound_slide = nil
		end
		-- Detach driver and refund mana
		if self.driver ~= nil then
			self.driver:set_detach()
			if mod_model then
				player_api.player_attached[self.driver:get_player_name()] = false
				player_api.set_animation(self.driver, "stand", 30)
			end
			if mod_mana then
				mana.setregen(self.driver:get_player_name(), mana.getregen(self.driver:get_player_name())+mana_regen_cost)
				self.driver:get_meta():set_int("flying_carpet:mana_cost", 0)
			end
		end
		minetest.sound_play("flying_carpet_out_of_energy", {pos = self.object:get_pos(), gain=0.7})
		self.object:remove()
		return
	end
end

minetest.register_entity("flying_carpet:carpet", carpet)

local longdesc, usagehelp, durability
if mod_doc_items then
	longdesc = S("Quickly explore the vast terrain with the magical flying carpet. But only the skilled users can master its speed, the fools will crash and hurt themselves. The carpet flies fast horizontally, but is only slowly able to change its rotation or height.")
	if mod_mana then
		if minetest.settings:get_bool("creative_mode") then
			longdesc = longdesc .. S(" It constantly reduces your mana resources and will wear out over time.")
		else
			longdesc = longdesc .. S(" It constantly reduces your mana resources.")
		end
	elseif not minetest.settings:get_bool("creative_mode") then
		longdesc = longdesc .. S(" It will wear out over time.")
	end
	usagehelp = ""
	usagehelp = usagehelp .. S("Look to the desired initial flight direction and place the carpet on any flat open surface. Make sure it has enough space (3×2×3), then place it. Right-click the carpet to sit on it and depart. You can only enter the flying carpet if it is not moving itself and you're not in another vehicle.") .. "\n\n"

	usagehelp = usagehelp .. S("Flight is controlled with the movement keys: Up to speed up, down to slow down, left and right to rotate slowly. Jump to rise, sneak to sink.") .. "\n\n"

	usagehelp = usagehelp .. S("The flying carpet has a basic movement speed which it is aiming to reach; thus, it flies without your intervention. Speed changes apply only for as long as you hold down the keys. As soon as you release the keys, the carpet will go back to its basic speed again. When the carpet is under a certain critical speed, it loses its magic and just drops on the ground. There's a short “grace period” at the beginning of the flight where this minimum speed limit does not apply. Watch the particles emitted by the carpet carefully: If they are yellow, everything is okay, but if they become red this means the carpet is going dangerously slow and you should speed up.") .. "\n\n"

	usagehelp = usagehelp .. S("The flying carpet also fails immediately if you crash into the landscape, which may even hurt you. You can also also take fall damage, but it is greatly reduced.")

	if mod_mana then
		usagehelp = usagehelp .. S(" Your carpet will also stop working if your mana resources are depleted.")
	end
	usagehelp = usagehelp .. S(" When your carpet stopped working, you have to collect the carpet (punch it) and place it again.") .. "\n\n"

	usagehelp = usagehelp .. S("If you fly directly down onto a flat solid ground, your flying carpet will come to a halt quickly due to friction. Your carpet can not fly into liquids from above, but it can fly into them from the side or even below. But the speed in liquids is greatly reduced and your carpet will likely fail.") .. "\n\n"

	if not minetest.settings:get_bool("creative_mode") then
		usagehelp = usagehelp .. S("Your carpet is not indestructible! Long flights, scratching and crashes will wear out the carpet over time and it might get destroyed eventually. Crashes deal major damage, sliding deals a very minor wear and flying deals a tiny amount of wear.") .. "\n\n"
		usagehelp = usagehelp .. S("On high wear levels, the carpet will emit black particles which will increase in number with its wear. At this point, you should get a replacement soon. On a critical wear level, the carpet will emit a very annoying loud noise while flying. If you hear this, you will have roughly five minutes worth of flight until the carpet finally disintegrates under your feet! Additionally, a flying carpet will disintegrate and is lost forever if it stands still and has no user for 1 minute.")

		durability = S("Ca. 12 hours worth of flight time, if you fly without accidents.")
	end
end

minetest.register_tool("flying_carpet:carpet", {
	description = S("Flying carpet"),
	_doc_items_longdesc = longdesc,
	_doc_items_usagehelp = usagehelp,
	_doc_items_durability = durability,
	inventory_image = "flying_carpet_inventory.png",
	wield_image = "flying_carpet_wield.png",
	wield_scale = {x=1.374, y=2, z=0.2},
	
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		local place_pos = pointed_thing.under
		place_pos.y = place_pos.y+1.5
		-- check if there is enough free space for the carpet
		local check_pos = vector.round(place_pos)
		for x=-1,1 do
			for y=-1,0 do
				for z=-1,1 do
					local node = minetest.get_node({x=check_pos.x+x, y=check_pos.y+y, z=check_pos.z+z})
					local nodedef = minetest.registered_nodes[node.name]
					if not (not nodedef.walkable and nodedef.liquidtype == "none") then
						return
					end
				end
			end
		end

		-- check if carpet wouldn't collide with any nearby carpet
		local conflict_objects = minetest.get_objects_inside_radius(place_pos, math.sqrt(2)*1.5)
		for i=1, #conflict_objects do
			local le = conflict_objects[i]:get_luaentity()
			if le ~= nil and le.name == "flying_carpet:carpet" then
				return
			end
		end

		local ent = minetest.add_entity(place_pos, "flying_carpet:carpet")
		ent:set_yaw(placer:get_look_horizontal()+math.pi/2)
		ent:get_luaentity().wear = itemstack:get_wear()

		if not minetest.settings:get_bool("creative_mode") then
			itemstack:take_item()
		end
		minetest.sound_play("flying_carpet_place", {pos = place_pos, gain = 1})
		return itemstack
	end,
})

if mod_mana then
	-- Restore mana regeneration when players leave
	minetest.register_on_joinplayer(function(player)
		local name = player:get_player_name()
		local meta = player:get_meta()
		local mana_cost = meta:get_int("flying_carpet:mana_cost") == 1
		if mana_cost then
			mana.setregen(name, mana.getregen(name)+mana_regen_cost)
			minetest.log("info", "[flying_carpet] Restoring mana regen for "..name..", who was previously attached to a carpet")
		end
	end)
end

if mod_craft then
	minetest.register_craft({
		output = "flying_carpet:carpet",
		recipe = { { "wool:red", "wool:yellow", "wool:red" },
			   { "wool:yellow", "wool:red", "wool:yellow" },
			   { "default:mese_crystal", "default:goldblock", "default:mese_crystal" } }
	})
end
if mod_craft_mcl2 then
	minetest.register_craft({
		output = "flying_carpet:carpet",
		recipe = { { "mcl_wool:red", "mcl_wool:yellow", "mcl_wool:red" },
			   { "mcl_wool:yellow", "mcl_wool:red", "mcl_wool:yellow" },
			   { "mesecons_torch:redstoneblock", "mcl_core:goldblock", "mesecons_torch:redstoneblock" } }
	})
end

if mod_doc_identifier then
	doc.sub.identifier.register_object("flying_carpet:carpet", "tools", "flying_carpet:carpet")
end
