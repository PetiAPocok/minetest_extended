local nodes_to_grow_on = {"default:cobble", "default:stone", "default:tree", "default:pine_tree",
    "default:aspen_tree", "default:jungletree", "default:acacia_tree"}

minetest.register_node("mex_moreblocks:moss", {
    description = "Moss",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, -0.45, 0.5}
    },
    tiles = {"mex_moreblocks_moss.png"},
    wield_image = "mex_moreblocks_moss.png",
    inventory_image = "mex_moreblocks_moss.png",
    use_texture_alpha = true,
    walkable = false,
    paramtype = "light",
    paramtype2 = "wallmounted",
    groups = {snappy = 3, attached_node=1},
})

function table_contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

-- Moss growth (spawning) on cobble, stone, wood near water

minetest.register_abm({
    label = "Moss growth",
    nodenames = nodes_to_grow_on,
    neighbors = {"group:water"},
    interval = 16,
    chance = 200,
    catch_up = false,
    action = function(pos, node)
        local moss_pos = minetest.find_node_near(pos, 1, "air")
        local calculated_param2 = 1

        if moss_pos then
            moss_pos.x = moss_pos.x - 1 -- Check West side of the moss if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(moss_pos).name) then
                calculated_param2 = 3
            end
            moss_pos.x = moss_pos.x + 2 -- Check East side of the moss if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(moss_pos).name) then
                calculated_param2 = 2
            end
            moss_pos.x = moss_pos.x -1 -- Reset moss_pos


            moss_pos.z = moss_pos.z - 1 -- Check South side of the moss if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(moss_pos).name) then
                calculated_param2 = 5
            end
            moss_pos.z = moss_pos.z + 2 -- Check North side of the moss if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(moss_pos).name) then
                calculated_param2 = 4
            end
            moss_pos.z = moss_pos.z -1 -- Reset moss_pos


            moss_pos.y = moss_pos.y + 1 -- Check above the moss if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(moss_pos).name) then
                calculated_param2 = 0
            end
            moss_pos.y = moss_pos.y - 1 -- Reset moss_pos


            if calculated_param2 == 1 then
                moss_pos.y = moss_pos.y - 1 -- Check below the moss if there is a block
                if table_contains(nodes_to_grow_on, minetest.get_node(moss_pos).name) then
                    moss_pos.y = moss_pos.y + 1 -- Reset moss_pos
                    minetest.set_node(moss_pos, {name = "mex_moreblocks:moss", param2 = calculated_param2})
                end
            else
                minetest.set_node(moss_pos, {name = "mex_moreblocks:moss", param2 = calculated_param2})
            end
        end
    end
})
