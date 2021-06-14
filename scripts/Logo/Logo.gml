function Logo(_x, _y) : Clickable(_x, _y) constructor{
//vars
	sprite = logo_spr
	clicks = 0
	secret = false
	width = sprite_get_width(logo_spr)
	height = sprite_get_height(logo_spr)
//methods
	click_action = function(){
		if clicks >= 20 and !secret {
			core.newicon(128, 256, "Easter Egg", 1)
			secret = true
		} else {
			clicks++
		}
	}
}