function TextContainer (_x, _y, _parent, _inner_text) : GameObject(_x, _y) constructor {
//vars
	parent = _parent
	width = 64
	height = 64
	inner_text = _inner_text
//system
	draw = function(){
		draw_rect(x,y,x+width,y+height,c_white,c_black)
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		surf = surface_create(width, height)
		surface_set_target(surf)
		draw_text_ext_transformed(0, 0, inner_text, 16, width, 1, 1, 0)
		surface_reset_target()
		draw_surface(surf, x, y)
		if height*width < string_width(inner_text)*string_height(inner_text) {
			draw_sprite(plus_spr,0,x+width-16,y+height-16)
		}
	}
//methods
	move = function(){
		if parent != noone {
			x = parent.x
			y = parent.y+16
			width = parent.width-16
			height = parent.height-16
		}
	}
//on_create
	if ds_map_exists(core.strings, inner_text){
		inner_text = core.strings[? inner_text].text
	}
}