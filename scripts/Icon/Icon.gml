function Icon(_x, _y, _inner_text, _count) : Draggable(_x, _y) constructor {
//vars
	object_type = "Icon"
	inner_text = _inner_text
	display_mode = 1
	icon_class = "Resource"
	count = define(_count, 1)
	lock_right = false
	parent = noone
	children = []
//system
	step = function(){
		_icon()
	}
	_icon = function(){
		_draggable()
		offbounds()
		split()
		overlap()
		poststep()
	}
	draw = function(){
		_icon_display()
	}
	_icon_display = function(){
		if visible {
			self_draw()
			caption()
		}
	}
//methods
	caption = function(){
		switch(icon_class){
			case "Text":
				var color = c_ltgray
				break
			case "Resource":
				var color = c_yellow
				break
			case "Container":
				var color = c_aqua
				break
			case "Factory":
				var color = c_lime
				break
			case "Action":
				var color = c_red
				break
			default:
				var color = c_white
				break
			}
		draw_set_valign(fa_middle)
		if display_mode == 1 {
			draw_set_halign(fa_center)
			draw_text_outlined_ext(x+(width/2), y+height+8, 3*width, inner_text, color, c_black)
		} else {
			draw_set_halign(fa_left)
			draw_text_outlined_ext(x+width+8, y+(height/2), 3*width, inner_text, color, c_black)
		}		
		if count > 1 {
			draw_set_halign(fa_center)
			draw_text_outlined(x+width, y+height, string(count), c_white, c_black)			
		}
		debug("")
	}
	debug = function(_str){
		draw_text_outlined_ext(x+width, y, 4*width, _str, c_red, c_green)	
	}
	link = function(_icon){
		array_push(children, _icon)
		core.move_layer(_icon, core.gui_layer)
		_icon.parent = self
		_icon.snappable = false
	}
	unlink = function(_icon){
		array_remove(children, _icon)
		_icon.original_layer = core.desktop_layer
		if !_icon.dragging {
			core.move_layer(_icon, core.desktop_layer)
		}
		_icon.x = x+32
		_icon.parent = noone
		_icon.snappable = true
	}
	split = function(){
		if dragging and mouse_check_button_pressed(mb_right) and !lock_right {
			lock_right = true
			core.newicon(x, y, inner_text, ceil(count/2))
			count = floor(count/2)
		}
	}
	offbounds = function(){
		if !dragging {
			if x < 0 {
				x = 0
			}
			if y < 0 {
				y = 0
			}
			if x+width > room_width {
				x = 0
				y += 32
			}
			if y+height > room_height {
				x += 32
				y = 0
			}
		}
	}
	destroy = function(){
		if dragging {
			core.cursor.release(self)
		}
		if parent != noone {
			parent.unlink(self)
		}
		core.destroy(self)
	}
	overlap = function(){
		if visible {
			for (var object=0; object<array_length(core.desktop_layer); object++){
				var test_obj = core.desktop_layer[object]
				if test_obj.object_type == "Icon" and test_obj != self and !self.dragging and !test_obj.dragging {
					if overlap_rectangle(self,test_obj) == 1 {
						if test_obj.inner_text == inner_text {
							count += test_obj.count
							test_obj.destroy()
						} else {
							if test_obj.icon_class == "Container" or test_obj.icon_class == "Factory" or test_obj.icon_class == "Action" {
								if array_find_index(test_obj.children, self) == -1 {
									test_obj.link(self)
								}
							} else {
								x += 32
							}
						}
					}
				}
			}
		}
	}
	poststep = function(){
		if parent != noone {
			if parent.wnd == noone {
				visible = false
			}
			if dragging {
				parent.unlink(self)
			}
		} else {
		}
		if mouse_check_button_released(mb_right){
			lock_right = false
		}
		if count < 1 {
			destroy()
		}
	}
//on_create
	var default_sprite = true
	if ds_map_exists(core.icon_data, inner_text){
		icon_class = core.icon_data[? inner_text].class
		var dir = working_directory + "/sprites/" + core.icon_data[? inner_text].sprite
		if file_exists(dir){
			sprite = sprite_add(dir,0,0,0,0,0)
			default_sprite = false
		}
	}
	if default_sprite {
		switch(icon_class){
			case "Text":
				sprite = text_spr
				break
			case "Resource":
				sprite = dot_icon_spr
				break
			case "Container":
				sprite = icon_spr
				break
			case "Factory":
				sprite = factory_spr
				break
			case "Action":
				sprite = generator_spr
				break
			default:
				sprite = dot_icon_spr
				break
		}
	}
}