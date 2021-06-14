function LoadButton(_x, _y, _game_id) constructor {
//vars
	x = _x
	y = _y
	sprite = button_spr
	frame = 0
	width = 64
	height = 64
	click_lock = false
	this_game_id = _game_id
	inner_text = ""
//system
	step = function(){
		check_click()
		if clicked() and !click_lock {
			click_action()
		}
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
		draw_text(x+(width/2),y+(height/2),string(this_game_id+1))
		draw_text_transformed_colour(x+(width/2), y+height-16, "Time:"+string(inner_text), 0.5, 0.5, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)
	}
//methods
	hovered = function(){
		return point_in_rectangle(mouse_x, mouse_y, x, y, x+width, y+height)
	}
	holding = function(){
		return mouse_check_button(mb_left) and hovered()
	}
	missed = function(){
		return mouse_check_button(mb_left) and !hovered()
	}
	clicked = function(){
		return mouse_check_button_pressed(mb_left) and hovered()
	}
	check_click = function(){
		if missed(){
			click_lock = true
		}
		if !mouse_check_button(mb_left){
			click_lock = false
		}
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
	click_action = function(){
		global.current_game_id = this_game_id
		room_goto_next()
	}
//on_create
	var _file = file_text_open_read(working_directory + "SAV"+string(this_game_id)+".sav")
	var _string = ""
	while (!file_text_eof(_file)){
		_string += file_text_readln(_file)
	}
	file_text_close(_file)
	inner_text = string(floor(json_parse(_string).time/360))
	while x+width > room_width {
		x -= room_width
		y += 64+32
	}
}