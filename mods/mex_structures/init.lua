local mod_path = minetest.get_modpath(minetest.get_current_modname())

mex_structures = {}

mex_structures.find_a_nice_place_on_the_surface = function(pos1, pos2, width, length)
    -- returns true if there is a [width] x [height] area between [pos1] and [pos2]
    local pos = table.copy(pos2)

    local node_name = minetest.get_node(pos).name

    while string.find(node_name, "dirt") == nil do
        pos.y = pos.y - 1
        node_name = minetest.get_node(pos).name
    end







    --
    --
    -- if pos2.y < 0 then
    --     --if the max pos is below 0 then byebye
    --     return
    -- end
    --
    -- local area = width * length
    -- local surface_count = 0
    -- local pos = table.copy(pos2)
    -- local found_surface = false
    --
    -- local node_name = minetest.get_node(pos).name
    -- while not found_surface and pos.y > pos1.y do
    --     for i=pos1.x,pos2.x do
    --         for j=pos1.z,pos2.z do
    --             pos.x = i
    --             pos.z = j
    --             node_name = minetest.get_node(pos).name
    --             if string.find(node_name, "dirt") == 1 then
    --                 surface_count = surface_count + 1
    --             end
    --         end
    --     end
    --
    --     minetest.log(surface_count)
    --
    --     if surface_count >= area then
    --         found_surface = true
    --         -- minetest.log(dump(pos))
    --     else
    --         surface_count = 0
    --         -- minetest.log("Nope\n" .. dump(pos))
    --         pos.y = pos.y - 1
    --     end
    -- end

    -- while node_name ~= "air" and string.find(node_name, "grass") == "fail" do
    --     pos.y = pos.y - 1
    --     node_name = minetest.get_node(pos)
    -- end

    -- "default:dirt_with_snow", "dirt_with_grass"
end

-- dofile(mod_path .. "/abandoned_house.lua")
