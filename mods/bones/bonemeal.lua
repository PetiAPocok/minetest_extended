bonemeal = {}

local min, max, random = math.min, math.max, math.random

-- Load for translation support.
local S = default.get_translator


-- creative check
local creative_mode_cache = minetest.settings:get_bool("creative_mode")
function is_creative(name)
	return creative_mode_cache or minetest.check_player_privs(name, {creative = true})
end


-- default crops
local crops = {
	{"farming:cotton_", 8, "farming:seed_cotton"},
	{"farming:wheat_", 8, "farming:seed_wheat"}
}


-- special pine check for nearby snow
local function pine_grow(pos)

	if minetest.find_node_near(pos, 1,
		{"default:snow", "default:snowblock", "default:dirt_with_snow"}) then

		default.grow_new_snowy_pine_tree(pos)
	else
		default.grow_new_pine_tree(pos)
	end
end


-- default saplings
local saplings = {
	{"default:sapling", default.grow_new_apple_tree, "soil"},
	{"default:junglesapling", default.grow_new_jungle_tree, "soil"},
	{"default:emergent_jungle_sapling", default.grow_new_emergent_jungle_tree, "soil"},
	{"default:acacia_sapling", default.grow_new_acacia_tree, "soil"},
	{"default:aspen_sapling", default.grow_new_aspen_tree, "soil"},
	{"default:pine_sapling", pine_grow, "soil"},
	{"default:bush_sapling", default.grow_bush, "soil"},
	{"default:acacia_bush_sapling", default.grow_acacia_bush, "soil"},
	{"default:large_cactus_seedling", default.grow_large_cactus, "sand"},
	{"default:pine_bush_sapling", default.grow_pine_bush, "soil"}
}

-- helper tables ( "" denotes a blank item )
local dry_grass = {
    "default:dry_grass_1", "default:dry_grass_2", "default:dry_grass_3", "default:dry_grass_4", "default:dry_grass_5", ""
}

local fern = {
	"default:fern_1", "default:fern_2", "default:fern_3", "", "", ""
}

local green_grass = {
	"default:grass_1", "default:grass_2", "default:grass_3", "default:grass_4", "default:grass_5", ""
}

local marram_grass = {
	"default:marram_grass_1", "default:marram_grass_2", "default:marram_grass_3", "", "", ""
}

local mushrooms = {
	"flowers:mushroom_red", "flowers:mushroom_brown", "flowers:puffball", "flowers:shaggy_inkcap", "", ""
}


-- add all in-game flowers except waterlily
local flowers = {}

for node, def in pairs(minetest.registered_nodes) do

	if def.groups.flower and not node:find("waterlily") then
		flowers[#flowers + 1] = node
	end
end

-- default biomes deco
local deco = {
    {"default:dirt_with_coniferous_litter", fern, mushrooms},
    {"default:dirt_with_dry_grass", dry_grass, {}},
    {"default:dirt_with_rainforest_litter", {"default:junglegrass","","",""}, {}},
    {"default:dirt_with_snow", {}, {}},
    {"default:desert_sand", {}, {"default:dry_shrub", "", "", ""}},
    {"default:dry_dirt_with_dry_grass", dry_grass, {}},
	{"default:sand", marram_grass, {}},
	{"default:silver_sand", {}, {"default:dry_shrub", "", "", ""}},
}


--
-- local functions
--


-- particles
local function particle_effect(pos)

	minetest.add_particlespawner({
		amount = 4,
		time = 0.15,
		minpos = pos,
		maxpos = pos,
		minvel = {x = -1, y = 2, z = -1},
		maxvel = {x = 1, y = 4, z = 1},
		minacc = {x = -1, y = -1, z = -1},
		maxacc = {x = 1, y = 1, z = 1},
		minexptime = 1,
		maxexptime = 1,
		minsize = 1,
		maxsize = 3,
		texture = "bonemeal_particle.png"
	})
end


-- tree type check
local function grow_tree(pos, object)

	if type(object) == "table" and object.axiom then
		-- grow L-system tree
		minetest.remove_node(pos)
		minetest.spawn_tree(pos, object)

	elseif type(object) == "string" and minetest.registered_nodes[object] then
		-- place node
		minetest.set_node(pos, {name = object})

	elseif type(object) == "function" then
		-- function
		object(pos)
	end
end


-- sapling check
local function check_sapling(pos, nodename)

	-- what is sapling placed on?
	local under =  minetest.get_node({
		x = pos.x,
		y = pos.y - 1,
		z = pos.z
	})

	local can_grow, grow_on

	-- check list for sapling and function
	for n = 1, #saplings do

		if saplings[n][1] == nodename then

			grow_on = saplings[n][3]

			-- sapling grows on top of specific node
			if grow_on
			and grow_on ~= "soil"
			and grow_on ~= "sand"
			and grow_on == under.name then
				can_grow = true
			end

			-- sapling grows on top of soil (default)
			if can_grow == nil
			and (grow_on == nil or grow_on == "soil")
			and minetest.get_item_group(under.name, "soil") > 0 then
				can_grow = true
			end

			-- sapling grows on top of sand
			if can_grow == nil
			and grow_on == "sand"
			and minetest.get_item_group(under.name, "sand") > 0 then
				can_grow = true
			end

			-- check if we can grow sapling
			if can_grow then
				particle_effect(pos)
				grow_tree(pos, saplings[n][2])
				return
			end
		end
	end
end


-- crops check
local function check_crops(pos, nodename, strength)

	local mod, crop, stage, nod, def

	-- grow registered crops
	for n = 1, #crops do

		if nodename:find(crops[n][1])
		or nodename == crops[n][3] then

			-- separate mod and node name
			mod = nodename:split(":")[1] .. ":"
			crop = nodename:split(":")[2]

			-- get stage number or set to 0 for seed
			stage = tonumber( crop:split("_")[2] ) or 0
			stage = min(stage + strength, crops[n][2])

			-- check for place_param setting
			nod = crops[n][1] .. stage
			def = minetest.registered_nodes[nod]
			def = def and def.place_param2 or 0

			minetest.set_node(pos, {name = nod, param2 = def})

			particle_effect(pos)

			return
		end
	end
end


-- check soil for specific decoration placement
local function check_soil(pos, nodename, strength)

	-- set radius according to strength
	local side = strength - 1
	local tall = max(strength - 2, 0)
	local floor
	local groups = minetest.registered_items[nodename]
		and minetest.registered_items[nodename].groups or {}

	-- only place decoration on one type of surface
	if groups.soil then
		floor = {"group:soil"}
	elseif groups.sand then
		floor = {"group:sand"}
	else
		floor = {nodename}
	end

	-- get area of land with free space above
	local dirt = minetest.find_nodes_in_area_under_air(
		{x = pos.x - side, y = pos.y - tall, z = pos.z - side},
		{x = pos.x + side, y = pos.y + tall, z = pos.z + side}, floor)

	-- set default grass and decoration
	local grass = green_grass
	local decor = flowers

	-- choose grass and decoration to use on dirt patch
	for n = 1, #deco do

		-- do we have a grass match?
		if nodename == deco[n][1] then
			grass = deco[n][2] or {}
			decor = deco[n][3] or {}
		end
	end

	local pos2, nod, def

	-- loop through soil
	for _, n in pairs(dirt) do

		if random(5) == 5 then
			if decor and #decor > 0 then
				-- place random decoration (rare)
				local dnum = #decor or 1
				nod = decor[random(dnum)] or ""
			end
		else
			if grass and #grass > 0 then
				-- place random grass (common)
				local dgra = #grass or 1
				nod = #grass > 0 and grass[random(dgra)] or ""
			end
		end

		pos2 = n

		pos2.y = pos2.y + 1

		if nod and nod ~= "" then

			-- get crop param2 value
			def = minetest.registered_nodes[nod]
			def = def and def.place_param2

			-- if param2 not preset then get from existing node
			if not def then
				local node = minetest.get_node_or_nil(pos2)
				def = node and node.param2 or 0
			end

			minetest.set_node(pos2, {name = nod, param2 = def})
		end

		particle_effect(pos2)
	end
end


-- global functions


-- add to sapling list
-- {sapling node, schematic or function name, "soil"|"sand"|specific_node}
--e.g. {"default:sapling", default.grow_new_apple_tree, "soil"}

function bones:add_sapling(list)

	for n = 1, #list do
		saplings[#saplings + 1] = list[n]
	end
end


-- add to crop list to force grow
-- {crop name start_, growth steps, seed node (if required)}
-- e.g. {"farming:wheat_", 8, "farming:seed_wheat"}
function bones:add_crop(list)

	for n = 1, #list do
		crops[#crops + 1] = list[n]
	end
end


-- add grass and flower/plant decoration for specific dirt types
--  {dirt_node, {grass_nodes}, {flower_nodes}
-- e.g. {"default:dirt_with_dry_grass", dry_grass, flowers}
-- if an entry already exists for a given dirt type, it will add new entries and all empty
-- entries, allowing to both add decorations and decrease their frequency.
function bones:add_deco(list)

	for l = 1, #list do

		for n = 1, #deco do

			-- update existing entry
			if list[l][1] == deco[n][1] then

				-- adding grass types
				for _, extra in pairs(list[l][2]) do

					if extra ~= "" then

						for _, entry in pairs(deco[n][2]) do

							if extra == entry then
								extra = false
								break
							end
						end
					end

					if extra then
						deco[n][2][#deco[n][2] + 1] = extra
					end
				end

				-- adding decoration types
				for _, extra in ipairs(list[l][3]) do

					if extra ~= "" then

						for __, entry in pairs(deco[n][3]) do

							if extra == entry then
								extra = false
								break
							end
						end
					end

					if extra then
						deco[n][3][#deco[n][3] + 1] = extra
					end
				end

				list[l] = false
				break
			end
		end

		if list[l] then
			deco[#deco + 1] = list[l]
		end
	end
end


-- definitively set a decration scheme
-- this function will either add a new entry as is, or replace the existing one
function bones:set_deco(list)

	for l = 1, #list do

		for n = 1, #deco do

			-- replace existing entry
			if list[l][1] == deco[n][1] then
				deco[n][2] = list[l][2]
				deco[n][3] = list[l][3]
				list[l] = false
				break
			end
		end

		if list[l] then
			deco[#deco + 1] = list[l]
		end
	end
end


-- global on_use function for bonemeal
function bones:on_use(pos, strength, node)

	-- get node pointed at
	local node = node or minetest.get_node(pos)

	-- return if nothing there
	if node.name == "ignore" then
		return
	end

	-- make sure strength is between 1 and 4
	strength = strength or 1
	strength = max(strength, 1)
	strength = min(strength, 4)

	-- papyrus and cactus
	if node.name == "default:reed" then

		default.grow_reed(pos, node)
		particle_effect(pos)
		return

	elseif node.name == "default:cactus" then

		default.grow_cactus(pos, node)
		particle_effect(pos)
		return
	end

	-- grow grass and flowers
	if minetest.get_item_group(node.name, "soil") > 0
	or minetest.get_item_group(node.name, "sand") > 0
	or minetest.get_item_group(node.name, "can_bonemeal") > 0 then
		check_soil(pos, node.name, strength)
		return
	end

	-- light check depending on strength (strength of 4 = no light needed)
	if (minetest.get_node_light(pos) or 0) < (12 - (strength * 3)) then
		return
	end

	-- check for tree growth if pointing at sapling
	if minetest.get_item_group(node.name, "sapling") > 0
	and random(5 - strength) == 1 then
		check_sapling(pos, node.name)
		return
	end

	-- check for crop growth
	check_crops(pos, node.name, strength)
end


--
-- items
--


-- mulch (strength 1)
minetest.register_craftitem("bones:mulch", {
	description = S("Mulch"),
	inventory_image = "bonemeal_mulch.png",

	on_use = function(itemstack, user, pointed_thing)

		-- did we point at a node?
		if pointed_thing.type ~= "node" then
			return
		end

		-- is area protected?
		if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
			return
		end

		-- take item if not in creative
		if not is_creative(user:get_player_name()) then
			itemstack:take_item()
		end

		-- call global on_use function with strength of 1
		bones:on_use(pointed_thing.under, 1)

		return itemstack
	end
})


-- bonemeal (strength 2)
minetest.register_craftitem("bones:bonemeal", {
	description = S("Bone Meal"),
	inventory_image = "bonemeal_item.png",

	on_use = function(itemstack, user, pointed_thing)

		-- did we point at a node?
		if pointed_thing.type ~= "node" then
			return
		end

		-- is area protected?
		if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
			return
		end

		-- take item if not in creative
		if not is_creative(user:get_player_name()) then
			itemstack:take_item()
		end

		-- call global on_use function with strength of 2
		bones:on_use(pointed_thing.under, 2)

		return itemstack
	end
})


-- fertiliser (strength 3)
minetest.register_craftitem("bones:fertiliser", {
	description = S("Fertiliser"),
	inventory_image = "bonemeal_fertiliser.png",

	on_use = function(itemstack, user, pointed_thing)

		-- did we point at a node?
		if pointed_thing.type ~= "node" then
			return
		end

		-- is area protected?
		if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
			return
		end

		-- take item if not in creative
		if not is_creative(user:get_player_name()) then
			itemstack:take_item()
		end

		-- call global on_use function with strength of 3
		bones:on_use(pointed_thing.under, 3)

		return itemstack
	end
})


-- bone
minetest.register_craftitem("bones:bone", {
	description = S("Bone"),
	inventory_image = "bonemeal_bone.png"
})

-- wet bonemeal
minetest.register_craftitem("bones:wet_bonemeal", {
	description = S("Wet Bonemeal"),
	inventory_image = "bonemeal_wet_bonemeal.png",
})

-- gelatin powder
minetest.register_craftitem("bones:gelatin_powder", {
	description = S("Gelatin Powder"),
	inventory_image = "bonemeal_gelatin_powder.png",
	groups = {food_gelatin = 1, flammable = 2}
})


--
-- crafting recipes
--


-- wet bonemeal
minetest.register_craft({
	output = "bones:wet_bonemeal 8",
	recipe = {
		{"bones:bonemeal", "bones:bonemeal", "bones:bonemeal"},
		{"bones:bonemeal", "bucket:bucket_water", "bones:bonemeal"},
		{"bones:bonemeal", "bones:bonemeal", "bones:bonemeal"},
	},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty 1"}
	}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "bones:gelatin_powder",
	recipe = "bones:wet_bonemeal"
})

-- bonemeal (from bone)
minetest.register_craft({
	type = "shapeless",
	output = "bones:bonemeal 2",
	recipe = {"bones:bone"}
})

-- bonemeal (from player bones)
minetest.register_craft({
	type = "shapeless",
	output = "bones:bonemeal 4",
	recipe = {"bones:bones_block"}
})

-- bonemeal (from coral skeleton)
minetest.register_craft({
	type = "shapeless",
	output = "bones:bonemeal 2",
	recipe = {"default:coral_skeleton"}
})

-- white dye (from bonemeal)
minetest.register_craft({
	type = "shapeless",
	output = "dye:white",
	recipe = {"bones:bonemeal"}
})

-- mulch
minetest.register_craft({
	type = "shapeless",
	output = "bones:mulch 4",
	recipe = {
		"group:tree", "group:leaves", "group:leaves",
		"group:leaves", "group:leaves", "group:leaves",
		"group:leaves", "group:leaves", "group:leaves"
	}
})

-- fertiliser
minetest.register_craft({
	type = "shapeless",
	output = "bones:fertiliser 2",
	recipe = {"bones:bonemeal", "bones:mulch"}
})


-- add bones to dirt
table.insert(minetest.registered_items["default:dirt"].drop.items, { rarity = 30, items = {"bones:bone"} })

-- add support for other plants
dofile(minetest.get_modpath("bones") .. "/bonemealable_plants.lua")

print (S("[MOD] bonemeal loaded"))
