function Container(_x, _y, _parent) : Window(_x, _y, _parent) constructor {
//vars
	current_cap = noone
	overflow = false
//system
	step = function(){
		capture()
		display()
	}
	draw = function(){
		draw_rect(x,y,x+width,y+height,c_white,c_black)
		if overflow {
			draw_sprite(plus_spr,0,x+width-resize_btn.width,y+height-2*resize_btn.height)
		}
	}
//methods
	capture = function(){
		var c_chal = core.cursor.drag_object
		if c_chal != noone {
			if c_chal.object_type = "Icon" {
				if overlap_rectangle(c_chal,self) == 1 {
					current_cap = c_chal
				} else {
					current_cap = noone
				}
			}
		}
		if c_chal == noone and current_cap != noone {
			if current_cap.inner_text != parent.inner_text {
				parent.link(current_cap)
				unduplicate()
			}
			current_cap = noone
		}
	}
	unduplicate = function(){
		for(var i=0; i<array_length(parent.children); i++){
			for(var j=i+1; j<array_length(parent.children); j++){
				if parent.children[i].inner_text == parent.children[j].inner_text {
					parent.children[i].count += parent.children[j].count
					parent.children[j].count = 0
				}
			}
		}
	}
	display = function(){
		if array_length(parent.children) > 0 {
			var available_cols = floor(width/64)
			if available_cols == 0 {
				available_cols = 1
			}
			var available_rows = floor((height-16)/64)
			for (var ch=0; ch<array_length(parent.children); ch++){
				var inteded_col = ch % available_cols
				var inteded_row = floor(ch/available_cols)
				if inteded_row >= available_rows {
					parent.children[ch].visible = false
					overflow = true
				} else {
					parent.children[ch].visible = true
					overflow = false
				}
				intended_x = 16+(inteded_col*64)
				intended_y = 32+(inteded_row*64)
				parent.children[ch].x = x+intended_x
				parent.children[ch].y = y+intended_y
			}
		}
	}
	move = function(){
		for (var ch=0; ch<array_length(elements); ch++){
			elements[ch].move()
		}
		display()
	}
}