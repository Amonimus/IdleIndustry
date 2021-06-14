function Shutdown(_x, _y) : Button(_x, _y) constructor {
//vars
	inner_text = "Shutdown"
	width = 96
//methods
	click_action = function(){
		core.SaveGame()
		game_end()
	}
}