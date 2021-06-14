function Clickable(_x, _y) : GameObject(_x, _y) constructor {
//vars
	click_lock = false
//system
	step = function(){
		_clickable()
	}
	_clickable = function(){
		check_click()
		if clicked() and !click_lock {
			click_action()
		}
	}
//methods
	click_action = function(){}
	missed = function(){
		return mouse_check_button(mb_left) and !hovered() and visible
	}
	clicked = function(){
		return mouse_check_button_pressed(mb_left) and hovered() and visible
	}
	check_click = function(){
		if missed(){
			click_lock = true
		}
		if !mouse_check_button(mb_left){
			click_lock = false
		}
	}
//on_create
}