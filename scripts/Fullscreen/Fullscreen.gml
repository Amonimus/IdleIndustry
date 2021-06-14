function Fullscreen(_x, _y) : Button(_x, _y) constructor {
//vars
	inner_text = "Fullscreen"
	width = 96
//methods
	click_action = function(){
		core.fullscreen(true)
	}
}