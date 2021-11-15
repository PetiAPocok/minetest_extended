minetest.register_craftitem("fun_altars:talos_puzzle", {
	description = "Talos Puzzle",
	inventory_image = "fun_altars_game.png",
    groups = {fun_altar_game = 1},
})

fun_altar_games.play_talos_puzzle = function()
    minetest.log("Dikk!")
end
