function OpenableIcon(_x, _y, _inner_text, _count) : Icon(_x, _y, _inner_text, _count) constructor {
//vars
	double_clk = 0
	wnd = noone
//system
	step = function(){
		_icon()
		double_click()
	}
//methods
	click_action = function(){
		double_clk += 0.9
	}
	double_click = function(){
		if double_clk > 0 {
			double_clk -= 0.05
		} else {
			double_clk = 0
		}
		if double_clk > 1 {
			double_clk = 0
			if wnd == noone {
				audio_play_sound(Open_snd,0,false)
				open_action()
			}
		}
	}
	open_action = function(){ }
}