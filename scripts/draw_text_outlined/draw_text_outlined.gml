function draw_text_outlined(_x, _y, _str, _color1, _color2){
	draw_text_colour(_x-1, _y-1, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x, _y-1, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x+1, _y-1, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x-1, _y, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x+1, _y, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x-1, _y+1, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x, _y+1, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x+1, _y+1, _str, _color2, _color2, _color2, _color2, 1)
	draw_text_colour(_x, _y, _str, _color1, _color1, _color1, _color1, 1)
}