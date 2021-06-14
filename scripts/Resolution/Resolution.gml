function Resolution(_x, _y, _w, _h) : Button(_x, _y) constructor {
//vars
	width = 128
	w = _w
	h = _h
	inner_text = "Res: "+string(w)+"x"+string(h)
//methods
	click_action = function(){
		core.changeScreen(w,h, true)
	}
}