function Timer(_x, _y) : GameObject(_x, _y) constructor {
//vars
	time = 0
	width = 96
	height = 16
//system
	step = function(){
		time++
		snap_corner()
	}
	draw = function(){
		draw_rect(x,y,x+width,y+height,c_white,c_black)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_left)
		draw_text_outlined(x+4,y+(height/2), "Day:"+string(floor(time/360)),c_white,c_black)
	}
//methods
	snap_corner = function(){
		x = room_width-width
		y = room_height-height
	}
//on_create
}