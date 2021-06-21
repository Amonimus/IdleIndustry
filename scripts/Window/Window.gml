function Window(_x, _y, _parent) : GameObject(_x, _y) constructor {
//vars
	width = 128
	height = 80
	min_width = 48
	min_height = 16	
	parent = _parent
	header = new WindowHeader(x, y, self)
	close_btn = new WindowClose(x, y, self)
	resize_btn = new WindowResize(x, y, self)
	//hint_icon = new WindowHint(x, y, self)
	elements = [header, close_btn, resize_btn]
//system
	draw = function(){
		draw_rect(x,y,x+width,y+height,c_white,c_black)
	}
//methods
	close = function(){
		for (var ele=0; ele<array_length(elements); ele++){
			core.destroy(elements[ele])
		}
		parent.wnd = noone
		core.destroy(self)
	}
	move = function(){
		for (var ele=0; ele<array_length(elements); ele++){
			elements[ele].move()
		}
	}
//on_create
	for (var ele=0; ele<array_length(elements); ele++){
		move()
		array_push(core.gui_layer, elements[ele])
	}
}