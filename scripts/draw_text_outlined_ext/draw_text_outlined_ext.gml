function draw_text_outlined_ext(_x, _y, _width, _str, _color1, _color2){
	draw_text_ext_colour(_x-1, _y-1, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x, _y-1, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x+1, _y-1, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x-1, _y, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x+1, _y, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x-1, _y+1, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x, _y+1, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x+1, _y+1, _str, 12, _width, _color2, _color2, _color2, _color2, 1)
	draw_text_ext_colour(_x, _y, _str, 12, _width, _color1, _color1, _color1, _color1, 1)
}