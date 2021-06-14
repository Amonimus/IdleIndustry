function WindowClose(_x, _y, _parent) : Button(_x, _y) constructor {
//vars
	width = 16
	height = 16
	parent = _parent
	sprite = close_spr
//system
	draw = function(){
		self_draw()
	}
//methods
	move = function(){
		x = parent.x+parent.width-width
		y = parent.y
	}
	click_action = function(){
		audio_play_sound(Open_snd,0,false)
		parent.close()
	}
}