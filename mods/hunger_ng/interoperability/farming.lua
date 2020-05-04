-- Farming Redo
--
-- Author  TenPlus1
-- Forums  https://forum.minetest.net/viewtopic.php?t=9019
-- VCS     https://notabug.org/TenPlus1/Farming

local add = hunger_ng.add_hunger_data

-- `farming:bread` is also a part of the default `farming` mod and it’s texture
-- is used for the hunger bar. Since Hunger NG depends on `farming` at least
-- the bread should be always available.
add('farming:bread',                                            { satiates = 5 })

add('farming:ananas',                                           { satiates = 7 })
add('farming:beetroot',                                         { satiates = 1 })
add('farming:blueberry',                                        { satiates = 1 })
add('farming:burger',                                           { satiates = 9 })
add('farming:carrot',                                           { satiates = 2 })
add('farming:chili',                                            { satiates = 1, heals= -1 })
add('farming:cucumber',                                         { satiates = 2 })
add('farming:garlic',                                           { satiates = 1, heals= -1 })
add('farming:grape',                                            { satiates = 3 })
add('farming:huckleberry',                                      { satiates = 1 })
add('farming:lettuce',                                          { satiates = 2 })
add('farming:onion',                                            { satiates = 2, heals = -1 })
add('farming:pea',                                              { satiates = 0.5 })
add('farming:peanut',                                           { satiates = 0.5 })
add('farming:potato',                                           { satiates = 2 })
add('farming:potato_baked',                                     { satiates = 3 })
add('farming:raspberry',                                        { satiates = 1 })
add('farming:strawberry',                                       { satiates = 1 })
add('farming:tomato',                                           { satiates = 1 })

add('farming:salt',                                             { satiates = -1 })
add('farming:sugar',                                            { satiates = -1 })
add('farming:bandit_burger',                                    { satiates = 7 })
add('farming:beans_with_onion',                                 { satiates = 15, returns = 'farming:bowl' })
--add('farming:beetroot_soup',                                    { satiates = 4, returns = 'farming:bowl' })
--add('farming:blueberry_muffin',                                 { satiates = 4 })
add('farming:blueberry_pie',                                    { satiates = 7 })
add('farming:burger',                                           { satiates = 9 })
add('farming:carrot_cake',                                      { satiates = 7 })
--add('farming:chili_bowl',                                       { satiates = 7, returns = 'farming:bowl' })
--add('farming:chocolate_dark',                                   { satiates = 2 })
add('farming:cookie',                                           { satiates = 2 })
add('farming:corn_boiled',                                      { satiates = 4 })
add('farming:corn_bread',                                       { satiates = 6 })
-- add('farming:donut',                                           { satiates = 2 })
-- add('farming:donut_apple',                                     { satiates = 3 })
-- add('farming:donut_chocolate',                                 { satiates = 2 })
add('farming:garlic_bread',                                     { satiates = 2 })
add('farming:huckleberry_pie',                                  { satiates = 7 })
add('farming:meatloaf',                                         { satiates = 7 })
add('farming:minced_meat',                                      { satiates = 2, heals = -1 })
--add('farming:pea_soup',                                         { satiates = 7, returns = 'farming:bowl' })
--add('farming:potato_salad',                                     { satiates = 3 })
add('farming:potato_mashed',                                    { satiates = 5 })
add('farming:raspberry_pie',                                    { satiates = 7 })
add('farming:rizibizi',                                         { satiates = 7 })
add('farming:rice_cooked',                                      { satiates = 5 })
add('farming:rice_pudding',                                     { satiates = 5 })
add('farming:strawberry_cake',                                  { satiates = 7 })
add('farming:tomato_juice',                                     { satiates = 1, returns = 'vessels:glass_bottle' })
