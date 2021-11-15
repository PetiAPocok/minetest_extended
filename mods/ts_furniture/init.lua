ts_furniture = {}

-- If true, you can sit on chairs and benches, when right-click them.
ts_furniture.enable_sitting = minetest.settings:get_bool("ts_furniture.enable_sitting", true)

-- Used for localization
local S = minetest.get_translator("ts_furniture")

if ts_furniture.enable_sitting then
    -- The following code is from "Get Comfortable [cozy]" (by everamzah; published under WTFPL).
    -- Thomas S. modified it, so that it can be used in this mod
    minetest.register_globalstep(function(dtime)
        local players = minetest.get_connected_players()
        for i = 1, #players do
            local name = players[i]:get_player_name()
            if default.player_attached[name] and not players[i]:get_attach() and
                    (players[i]:get_player_control().up == true or
                            players[i]:get_player_control().down == true or
                            players[i]:get_player_control().left == true or
                            players[i]:get_player_control().right == true or
                            players[i]:get_player_control().jump == true) then
                players[i]:set_eye_offset({ x = 0, y = 0, z = 0 }, { x = 0, y = 0, z = 0 })
                players[i]:set_physics_override(1, 1, 1)
                default.player_attached[name] = false
                default.player_set_animation(players[i], "stand", 30)
            end
        end
    end)
end

ts_furniture.sit = function(name, pos)
	local player = minetest.get_player_by_name(name)
	if default.player_attached[name] then
		player:set_eye_offset({ x = 0, y = 0, z = 0 }, { x = 0, y = 0, z = 0 })
		player:set_physics_override(1, 1, 1)
		default.player_attached[name] = false
		default.player_set_animation(player, "stand", 30)
	else
		player:moveto(pos)
		player:set_eye_offset({ x = 0, y = -7, z = 2 }, { x = 0, y = 0, z = 0 })
		player:set_physics_override(0, 0, 0)
		default.player_attached[name] = true
		default.player_set_animation(player, "sit", 30)
	end
end
-- end of cozy-code

local furnitures = {
	["chair"] = {
		description = "Chair",
		sitting = true,
		nodebox = {
			{ -0.3, -0.5, 0.2, -0.2, 0.5, 0.3 }, -- foot 1
			{ 0.2, -0.5, 0.2, 0.3, 0.5, 0.3 }, -- foot 2
			{ 0.2, -0.5, -0.3, 0.3, -0.1, -0.2 }, -- foot 3
			{ -0.3, -0.5, -0.3, -0.2, -0.1, -0.2 }, -- foot 4
			{ -0.3, -0.1, -0.3, 0.3, 0, 0.2 }, -- seating
			{ -0.2, 0.1, 0.25, 0.2, 0.4, 0.26 } -- conector 1-2
		},
		craft = function(recipe)
			return {
				{ "", "group:stick" },
				{ recipe, recipe },
				{ "group:stick", "group:stick" }
			}
		end
	},
	["table"] = {
		description = "Table",
		nodebox = {
			{ -0.4, -0.5, -0.4, -0.3, 0.4, -0.3 }, -- foot 1
			{ 0.3, -0.5, -0.4, 0.4, 0.4, -0.3 }, -- foot 2
			{ -0.4, -0.5, 0.3, -0.3, 0.4, 0.4 }, -- foot 3
			{ 0.3, -0.5, 0.3, 0.4, 0.4, 0.4 }, -- foot 4
			{ -0.5, 0.4, -0.5, 0.5, 0.5, 0.5 }, -- table top
		},
		craft = function(recipe)
			return {
				{ recipe, recipe, recipe },
				{ "group:stick", "", "group:stick" },
				{ "group:stick", "", "group:stick" }
			}
		end
	},
	["bench"] = {
		description = "Bench",
		sitting = true,
		nodebox = {
			{ -0.5, -0.1, 0, 0.5, 0, 0.5 }, -- seating
			{ -0.4, -0.5, 0, -0.3, -0.1, 0.5 }, -- foot 1
			{ 0.3, -0.5, 0, 0.4, -0.1, 0.5 }, -- foot 2
		},
		craft = function(recipe)
			return {
				{ recipe, recipe },
				{ "group:stick", "group:stick" }
			}
		end
	},
}

local ignore_groups = {
	["wood"] = true,
	["stone"] = true,
}

function ts_furniture.register_furniture(recipe, description, texture)
	local recipe_def = minetest.registered_items[recipe]
	if not recipe_def then
		return
	end

	local groups = {}
	for k, v in pairs(recipe_def.groups) do
		if not ignore_groups[k] then
			groups[k] = v
		end
	end

	for furniture, def in pairs(furnitures) do
		local node_name = "ts_furniture:" .. recipe:gsub(":", "_") .. "_" .. furniture

		def.on_rightclick = nil

		if def.sitting and ts_furniture.enable_sitting then
			def.on_rightclick = function(pos, node, player, itemstack, pointed_thing)
				ts_furniture.sit(player:get_player_name(), pos)
			end
		end

		minetest.register_node(":" .. node_name, {
			description = S(description .. " " .. def.description),
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			tiles = { texture },
			groups = groups,
			node_box = {
				type = "fixed",
				fixed = def.nodebox
			},
			on_rightclick = def.on_rightclick
		})

		minetest.register_craft({
			output = node_name,
			recipe = def.craft(recipe)
		})
	end
end

ts_furniture.register_furniture("default:aspen_wood", "Aspen", "default_aspen_wood.png")
ts_furniture.register_furniture("default:pine_wood", "Pine", "default_pine_wood.png")
ts_furniture.register_furniture("default:acacia_wood", "Acacia", "default_acacia_wood.png")
ts_furniture.register_furniture("default:wood", "Wooden", "default_wood.png")
ts_furniture.register_furniture("default:junglewood", "Jungle Wood", "default_junglewood.png")

if (minetest.get_modpath("moretrees")) then
	ts_furniture.register_furniture("moretrees:apple_tree_planks", "Apple Tree", "moretrees_apple_tree_wood.png")
	ts_furniture.register_furniture("moretrees:beech_planks", "Beech", "moretrees_beech_wood.png")
	ts_furniture.register_furniture("moretrees:birch_planks", "Birch", "moretrees_birch_wood.png")
	ts_furniture.register_furniture("moretrees:fir_planks", "Fir", "moretrees_fir_wood.png")
	ts_furniture.register_furniture("moretrees:oak_planks", "Oak", "moretrees_oak_wood.png")
	ts_furniture.register_furniture("moretrees:palm_planks", "Palm", "moretrees_palm_wood.png")
	ts_furniture.register_furniture("moretrees:rubber_tree_planks", "Rubber Tree", "moretrees_rubber_tree_wood.png")
	ts_furniture.register_furniture("moretrees:sequoia_planks", "Sequoia", "moretrees_sequoia_wood.png")
	ts_furniture.register_furniture("moretrees:spruce_planks", "Spruce", "moretrees_spruce_wood.png")
	ts_furniture.register_furniture("moretrees:willow_planks", "Willow", "moretrees_willow_wood.png")
end

if minetest.get_modpath("ethereal") then
	ts_furniture.register_furniture("ethereal:banana_wood", "Banana", "banana_wood.png")
	ts_furniture.register_furniture("ethereal:birch_wood", "Birch", "moretrees_birch_wood.png")
	ts_furniture.register_furniture("ethereal:frost_wood", "Frost", "frost_wood.png")
	ts_furniture.register_furniture("ethereal:mushroom_trunk", "Mushroom", "mushroom_trunk.png")
	ts_furniture.register_furniture("ethereal:palm_wood", "Palm", "moretrees_palm_wood.png")
	ts_furniture.register_furniture("ethereal:redwood_wood", "Redwood", "redwood_wood.png")
	ts_furniture.register_furniture("ethereal:sakura_wood", "Sakura", "ethereal_sakura_wood.png")
	ts_furniture.register_furniture("ethereal:scorched_tree", "Scorched", "scorched_tree.png")
	ts_furniture.register_furniture("ethereal:willow_wood", "Willow", "willow_wood.png")
	ts_furniture.register_furniture("ethereal:yellow_wood", "Healing Tree", "yellow_wood.png")
end
