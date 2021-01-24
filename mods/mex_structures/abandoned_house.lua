-- Length: 13
-- Width:  9
-- Height: 12
local pos = {x=0,Y=0,z=0}
local mod_path = minetest.get_modpath(minetest.get_current_modname())
local file = io.open(mod_path .. "/schematics/abandoned_house.we", "rb")
local value = file:read("*a")
file:close()

local version = worldedit.read_header(value)
if version == nil or version == 0 then
    minetest.log("error", "File is invalid!")
    return
elseif version > worldedit.LATEST_SERIALIZATION_VERSION then
    minetest.log("error", "File was created with newer version of WorldEdit!")
    return
end

local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if maxp.y > 0 then
            local biome = minetest.get_biome_name(minetest.get_biome_data(minp).biome)

             -- offos biomeok:
             --    rainforest
             --    rainforest_ocean
             --    dedicious_forest
             --    dedicious_forest_ocean
             --

            -- Jó lehet biome:
            --     coniferous_forest almás erdő de dombos
            --     taiga havas fenyő erdő de dombos
            --     grassland
            --     savanna
            --
            --

            -- minetest.log("minp: " .. dump(minp))
            -- minetest.log("maxp: " .. dump(maxp))
            -- minetest.log(dump(biome))
            mex_structures.find_a_nice_place_on_the_surface(minp, maxp, 9, 13)
            -- minetest.log(dump(area))
            -- worldedit.deserialize(pos, value)
            -- minetest.log("info", "Abadoned house placed at " .. dump(pos))

            -- list of positions.
            --   * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
            --   * Return value: Table with all node positions with a node air above
            --   * Area volume is limited to 4,096,000 nodes

            -- local biome = minetest.get_biome_data(cpos)
            -- biome = biome and minetest.get_biome_name(biome.biome) or ""
            -- local type = "normal"
            -- if biome:find("desert") == 1 then
                -- 	type = "desert"
                -- elseif biome:find("sandstone_desert") == 1 then
                    -- 	type = "sandstone"
                    -- elseif biome:find("icesheet") == 1 then
                        -- 	type = "ice"
                        -- end
        end
    end)


end
