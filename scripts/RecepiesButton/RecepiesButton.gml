function RecepiesButton(_x, _y) : Button(_x, _y) constructor {
//vars
	inner_text = "Recepies"
	wnd = noone
//methods
	click_action = function(){
		if wnd == noone {
			wnd = new TextWindow(64, 64, self, "Recepies")
			array_push(core.window_layer, wnd)
		}
	}
}