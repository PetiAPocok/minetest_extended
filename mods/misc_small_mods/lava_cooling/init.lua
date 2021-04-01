local function search_nearby_nodes(pos, node)
	if minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name == node then return true end
	return false
end

default.cool_lava = function(pos, node)
	if node.name == "default:lava_source" then
		if search_nearby_nodes(pos,"default:water_source")
		or search_nearby_nodes(pos,"default:water_flowing") then
			minetest.set_node(pos, {name="default:obsidian"})
		end
	else -- Lava flowing
		if search_nearby_nodes(pos,"default:water_source") then
			minetest.set_node(pos, {name="mex_moreblocks:basalt"})
		elseif search_nearby_nodes(pos,"default:water_flowing") then
			minetest.set_node(pos, {name="mex_moreblocks:pumice"})
		end
	end
end
