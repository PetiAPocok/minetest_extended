minetest.register_on_newplayer(function(player)
    player:get_inventory():add_item("main", "craftguide:book")
end)
