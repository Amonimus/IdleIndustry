function overlap_rectangle(obj1, obj2){
	return rectangle_in_rectangle(obj1.x,obj1.y,obj1.x+obj1.width,obj1.y+obj1.height,obj2.x,obj2.y,obj2.x+obj2.width,obj2.y+obj2.height)
}