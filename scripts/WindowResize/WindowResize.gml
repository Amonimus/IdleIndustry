function WindowResize(_x, _y, _parent) : Draggable(_x, _y) constructor {
//vars
	width = 16
	height = 16
	parent = _parent
	sprite = resize_spr
	fit_lock = true
//system
	step = function(){
		_windowreside()
	}
	_windowreside = function(){
		_draggable()
		if dragging {
			limit_move()
			fit_lock = false
			fit()
		}
	}
//methods
	move = function(){
		x = parent.x+parent.width-width
		y = parent.y+parent.height-height
	}
	limit_move = function(){
		if x-parent.x < parent.min_width {
			x = parent.x+parent.min_width
		}
		if y-parent.y < parent.min_height {
			y = parent.y+parent.min_height
		}
	}
	fit = function(){
		parent.width = x+width-parent.x
		parent.height = y+height-parent.y
		parent.close_btn.move()
		parent.hint_icon.move()
		parent.header.width = parent.width-parent.close_btn.width-parent.hint_icon.width
	}
	postsnap = function(){
		if !fit_lock {
			fit()
			fit_lock = true
		}
	}
}