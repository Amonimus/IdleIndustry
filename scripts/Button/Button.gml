function Button(_x, _y, _inner_text) : Clickable(_x, _y) constructor {
//vars
	sprite = button_spr
	frame = 0
	width = 80
	height = 16
	inner_text = define(_inner_text, "Button")
//system
	step = function(){
		_button()
	}
	_button = function(){
		_clickable()
		highlight()
	}
	draw = function(){
		draw_sprite_part(sprite, frame,0,0,8,8,x,y)
		draw_sprite_part(sprite, frame,0,16,8,8,x,y+height-8)
		draw_sprite_part(sprite, frame,16,0,8,8,x+width-8,y)
		draw_sprite_part(sprite, frame,16,16,8,8,x+width-8,y+height-8)
		for (var i=8; i<width-8; i+=8){
			draw_sprite_part(sprite, frame,8,0,8,8,x+i,y)
			draw_sprite_part(sprite, frame,8,16,8,8,x+i,y+height-8)
		}
		for (var i=8; i<height-8; i+=8){
			draw_sprite_part(sprite, frame,0,8,8,8,x,y+i)
			draw_sprite_part(sprite, frame,16,8,8,8,x+width-8,y+i)
		}
		for (var w=8; w<width-8; w+=8){
			for (var h=8; h<height-8; h+=8){
				draw_sprite_part(sprite, frame,8,8,8,8,x+w,y+h)
			}
		}
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		draw_text(x+(width/2),y+(height/2),inner_text)
	}
//methods
	click_action = function(){
		show_debug_message("You've clicked me")
	}
	highlight = function(){
		if hovered() {
			if holding() and !click_lock {
				frame = 2
			} else {			
				frame = 1
			}
		} else {
			frame = 0
		}
	}
//on_create
}