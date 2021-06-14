function ContainerIcon(_x, _y, _inner_text, _count) : OpenableIcon(_x, _y, _inner_text, _count) constructor {
//vars
//systen
	step = function(){
		_openableicon()
	}
	_openableicon = function(){
		_icon()
		double_click()
	}
//methods
	open_action = function(){
		if wnd == noone {
			wnd = new Container(x+64, y-32, self)
			array_push(core.window_layer, wnd)
		}
	}
	unwrap = function(){
		var temp = []
		for (var ch=0; ch<array_length(children); ch++){
			array_push(temp, children[ch])
		}
		for (var ch=0; ch<array_length(temp); ch++){
			self.unlink(temp[ch])
		}
		if wnd != noone {
			wnd.close()
		}
		destroy()
	}
}