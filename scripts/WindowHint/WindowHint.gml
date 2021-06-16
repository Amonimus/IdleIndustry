function WindowHint(_x, _y, _parent) : GameObject(_x, _y) constructor {
//vars
	width = 16
	height = 16
	parent = _parent
	sprite = info_spr
	wnd = noone
//system
	step = function(){
		if hovered() {
			if wnd == noone {
				show_debug_message("POPUP")
				wnd = new TextContainer(mouse_x, mouse_y, self, "Info_"+parent.parent.inner_text)
				array_push(core.hold_layer, wnd)
			}
		} else {
			if wnd != noone {
				core.destroy(wnd)
				wnd = noone
			}
		} 
	}
//methods
	move = function(){
		x = parent.x+parent.width-2*width
		y = parent.y
	}
}