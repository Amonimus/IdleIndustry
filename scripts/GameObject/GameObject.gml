function GameObject(_x, _y) constructor {
//vars
	x = _x
	y = _y
	object_type = "GameObject"
	sprite = noone
	width = 32
	height = 32
	visible = true
	core = GameMaster.Core
//system
	step = function(){}
	draw = function(){
		self_draw()
	}
//methods
	self_draw = function(){
		if sprite != noone {
			draw_sprite(sprite, 0, x, y)
		}
	}
	define = function(_var, _default){
		if _var != undefined {	
			return _var
		} else {
			return _default
		}
	}
	hovered = function(){
		return point_in_rectangle(mouse_x, mouse_y, x, y, x+width, y+height)
	}
	holding = function(){
		return mouse_check_button(mb_left) and hovered() and visible
	}
//on_create
}