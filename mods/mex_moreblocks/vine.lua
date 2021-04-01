local nodes_to_grow_on = {"default:tree", "default:pine_tree",
    "default:aspen_tree", "default:jungletree", "default:acacia_tree"}

minetest.register_node("mex_moreblocks:vine", {
    description = "Vine",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, -0.45, 0.5}
    },
    tiles = {"mex_moreblocks_vine.png"},
    wield_image = "mex_moreblocks_vine.png",
    inventory_image = "mex_moreblocks_vine.png",
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

-- Vine growth (spawning) on cobble, stone, wood near water

minetest.register_abm({
    label = "Vine growth",
    nodenames = nodes_to_grow_on,
    interval = 180,
    chance = 1000,
    catch_up = false,
    action = function(pos, node)
        local vine_pos = minetest.find_node_near(pos, 1, "air")
        local calculated_param2 = 1

        if vine_pos then
            vine_pos.x = vine_pos.x - 1 -- Check West side of the vine if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(vine_pos).name) then
                calculated_param2 = 3
            end
            vine_pos.x = vine_pos.x + 2 -- Check East side of the vine if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(vine_pos).name) then
                calculated_param2 = 2
            end
            vine_pos.x = vine_pos.x -1 -- Reset vine_pos


            vine_pos.z = vine_pos.z - 1 -- Check South side of the vine if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(vine_pos).name) then
                calculated_param2 = 5
            end
            vine_pos.z = vine_pos.z + 2 -- Check North side of the vine if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(vine_pos).name) then
                calculated_param2 = 4
            end
            vine_pos.z = vine_pos.z -1 -- Reset vine_pos


            vine_pos.y = vine_pos.y + 1 -- Check above the vine if there is a block
            if table_contains(nodes_to_grow_on, minetest.get_node(vine_pos).name) then
                calculated_param2 = 0
            end
            vine_pos.y = vine_pos.y - 1 -- Reset vine_pos


            if calculated_param2 == 1 then
                vine_pos.y = vine_pos.y - 1 -- Check below the vine if there is a block
                if table_contains(nodes_to_grow_on, minetest.get_node(vine_pos).name) then
                    vine_pos.y = vine_pos.y + 1 -- Reset vine_pos
                    minetest.set_node(vine_pos, {name = "mex_moreblocks:vine", param2 = calculated_param2})
                end
            else
                minetest.set_node(vine_pos, {name = "mex_moreblocks:vine", param2 = calculated_param2})
            end
        end
    end
})
