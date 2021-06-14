function Draggable(_x, _y) : Clickable(_x, _y) constructor {
//vars
	dragging = false
	drag_delay = 0
	snappable = true
	original_layer = noone
//system
	step = function(){
		_draggable()
	}
	_draggable = function(){
		_clickable()
		if holding() and !dragging and !click_lock {
			drag_delay += 0.1
			if drag_delay > 2 {
				drag_delay = 0
				core.cursor.pick(self)
				click_lock = true
			}
		} else {
			drag_delay = 0
		}
		if dragging {
			x = mouse_x-(width/2)
			y = mouse_y-(height/2)
			if !mouse_check_button(mb_left){
				core.cursor.release(self)
			}
		} else {
			gridsnap()
		}
	}
//methods
	gridsnap = function(){
		if snappable {
			x = 16*round(x/16)
			y = 16*round(y/16)
			postsnap()
		}
	}
	postsnap = function(){ }
//on_create
}