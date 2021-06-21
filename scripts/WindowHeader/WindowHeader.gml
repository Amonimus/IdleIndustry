function WindowHeader(_x, _y, _parent) : Draggable(_x, _y) constructor {
//vars
	width = 32
	height = 16
	parent = _parent
	inner_text = parent.parent.inner_text
//system
	step = function(){
		_windowheader()
	}
	_windowheader = function(){
		_draggable()
		if dragging {
			parent.move()
		}
		width = parent.width-parent.close_btn.width
	}
	draw = function(){
		draw_rect(x,y,x+width,y+height,c_white,c_black)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_left)
		surf = surface_create(width, height)
		surface_set_target(surf)
		draw_text(2,(height/2),inner_text)	
		surface_reset_target()
		draw_surface(surf, x, y)
	}
	move = function(){
		parent.x = x
		parent.y = y
		if y+height > room_height {
			y -= 48
		}
		if y < 0 {
			y += 32
		}
		if x+width > room_width {
			x -= 32
		}
		if x < 0 {
			x += 32
		}
		parent.close_btn.move()
		parent.resize_btn.move()
	}
	postsnap = function(){
		parent.move()
	}
}