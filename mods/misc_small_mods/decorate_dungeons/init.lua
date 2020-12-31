local furnitures = {"default_wood_table","default_pine_wood_table", "default_junglewood_table",
    "default_aspen_wood_table", "default_acacia_wood_table"}

local paintings = {}

for _, node in pairs(minetest.registered_items) do
    if minetest.get_item_group(node.name, "painting") == 1 then
        table.insert(paintings, node.name)
    end
end

local function find_walls(cpos)
    local is_wall = function(node)
        return node.name ~= "air" and node.name ~= "ignore"
    end

    local dirs = {{x=1, z=0}, {x=-1, z=0}, {x=0, z=1}, {x=0, z=-1}}
    local get_node = minetest.get_node

    local ret = {}
    local mindist = {x=0, z=0}
    local min = function(a, b) return a ~= 0 and math.min(a, b) or b end
    for _, dir in ipairs(dirs) do
        for i = 1, 9 do -- 9 = max room size / 2
            local pos = vector.add(cpos, {x=dir.x*i, y=0, z=dir.z*i})

            -- continue in that direction until we find a wall-like node
            local node = get_node(pos)
            if is_wall(node) then
                local front_below = vector.subtract(pos, {x=dir.x, y=1, z=dir.z})
                local above = vector.add(pos, {x=0, y=1, z=0})

                -- check that it:
                --- is at least 2 nodes high (not a staircase)
                --- has a floor
                if is_wall(get_node(front_below)) and is_wall(get_node(above)) then
                    table.insert(ret, {pos = pos, facing = {x=-dir.x, y=0, z=-dir.z}})
                    if dir.z == 0 then
                        mindist.x = min(mindist.x, i-1)
                    else
                        mindist.z = min(mindist.z, i-1)
                    end
                end
                -- abort even if it wasn't a wall cause something is in the way
                break
            end
        end
    end

    local biome = minetest.get_biome_data(cpos)
    biome = biome and minetest.get_biome_name(biome.biome) or ""
    local type = "normal"
    if biome:find("desert") == 1 then
        type = "desert"
    elseif biome:find("sandstone_desert") == 1 then
        type = "sandstone"
    elseif biome:find("icesheet") == 1 then
        type = "ice"
    end

    return {
        walls = ret,
        size = {x=mindist.x*2, z=mindist.z*2},
        type = type,
    }
end

local function noise3d_integer(noise, pos)
    return math.abs(math.floor(noise:get_3d(pos) * 0x7fffffff))
end

local function random_sample(rand, list, count)
    local ret = {}
    for n = 1, count do
        local idx = rand:next(1, #list)
        table.insert(ret, list[idx])
        table.remove(list, idx)
    end
    return ret
end

minetest.register_on_generated(function(minp, maxp, blockseed)
    local gennotify = minetest.get_mapgen_object("gennotify")
    local poslist = gennotify["dungeon"] or {}
    for _, entry in ipairs(gennotify["temple"] or {}) do
        table.insert(poslist, entry)
    end
    if #poslist == 0 then return end

    local noise = minetest.get_perlin(10115, 4, 0.5, 1)
    local rand = PcgRandom(noise3d_integer(noise, poslist[1]))

    local candidates = {}
    -- process at most 20 rooms to keep runtime of this predictable
    local num_process = math.min(#poslist, 20)
    for i = 1, num_process do
        local room = find_walls(poslist[i])
        -- skip small rooms and everything that doesn't at least have 3 walls
        if math.min(room.size.x, room.size.z) >= 4 and #room.walls >= 3 then
            table.insert(candidates, room)
        end
    end

    local rooms = random_sample(rand, candidates, #candidates)

    for _, room in ipairs(rooms) do
        -- choose place somewhere in front of any of the walls
        local wall = room.walls[rand:next(1, #room.walls)]
        local v, vi -- vector / axis that runs alongside the wall
        if wall.facing.x ~= 0 then
            v, vi = {x=0, y=0, z=1}, "z"
        else
            v, vi = {x=1, y=0, z=0}, "x"
        end
        local table_pos = vector.add(wall.pos, wall.facing)
        local off = rand:next(-room.size[vi]/2 + 1, room.size[vi]/3 - 1)
        table_pos = vector.add(table_pos, vector.multiply(v, off))

        if minetest.get_node(table_pos).name == "air" then
            -- make it face inwards to the room
            local facedir = minetest.dir_to_facedir(vector.multiply(wall.facing, -1))
            minetest.add_node(table_pos, {name = "ts_furniture:" .. furnitures[math.random(1, #furnitures)], param2 = facedir})
        end
    end
end)


minetest.register_on_generated(function(minp, maxp, blockseed)
    local gennotify = minetest.get_mapgen_object("gennotify")
    local poslist = gennotify["dungeon"] or {}
    for _, entry in ipairs(gennotify["temple"] or {}) do
        table.insert(poslist, entry)
    end
    if #poslist == 0 then return end

    local noise = minetest.get_perlin(10115, 4, 0.5, 1)
    local rand = PcgRandom(noise3d_integer(noise, poslist[1]))

    local candidates = {}
    -- process at most 20 rooms to keep runtime of this predictable
    local num_process = math.min(#poslist, 20)
    for i = 1, num_process do
        local room = find_walls(poslist[i])
        -- skip small rooms and everything that doesn't at least have 3 walls
        if math.min(room.size.x, room.size.z) >= 4 and #room.walls >= 3 then
            table.insert(candidates, room)
        end
    end

    local rooms = random_sample(rand, candidates, #candidates)

    for _, room in ipairs(rooms) do
        -- choose place somewhere in front of any of the walls
        local wall = room.walls[rand:next(1, #room.walls)]
        local v, vi -- vector / axis that runs alongside the wall
        if wall.facing.x ~= 0 then
            v, vi = {x=0, y=0, z=1}, "z"
        else
            v, vi = {x=1, y=0, z=0}, "x"
        end
        local painting_pos = vector.add(wall.pos, wall.facing)
        local off = rand:next(-room.size[vi]/3 + 1, room.size[vi]/2 - 1)
        painting_pos = vector.add(painting_pos, vector.multiply(v, off))
        painting_pos.y = painting_pos.y + 1

        if minetest.get_node(painting_pos).name == "air" then
            -- make it face inwards to the room
            local facedir = 2

            if wall.facing.x == 1 then
                facedir = 3
            elseif wall.facing.x == -1 then
                facedir = 2
            elseif wall.facing.z == 1 then
                facedir = 5
            elseif wall.facing.z == -1 then
                facedir = 4
            end

            minetest.add_node(painting_pos, {name = paintings[math.random(1, #paintings)], param2 = facedir})
        end
    end
end)
