function TextIcon(_x, _y, _inner_text, _count) : OpenableIcon(_x, _y, _inner_text, _count) constructor {
//vars
//systen
//methods
	open_action = function(){
		if wnd == noone {
			wnd = new TextWindow(x+64, y-32, self, inner_text)
			array_push(core.window_layer, wnd)
		}
	}
}