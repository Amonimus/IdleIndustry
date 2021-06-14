function draw_rect(_x1, _y1, _x2, _y2, _color, _fill){
	if _fill != "none" {
		draw_rectangle_color(_x1,_y1,_x2-1,_y2-1,_fill,_fill,_fill,_fill,false)
	}
	draw_rectangle_color(_x1+1,_y1+1,_x2-2,_y2-2,_color,_color,_color,_color,true)
}