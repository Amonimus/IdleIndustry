function FactoryIcon(_x, _y, _inner_text, _count) : ContainerIcon(_x, _y, _inner_text, _count) constructor {
//vars
	progress = 0
	notification = false
	recepies = core.recepies[? inner_text]
	working_recepie = -1
//system
	step = function(){
		_openableicon()
		populate()
		build()
		if wnd != noone {
			notification = false
		}
	}
	draw = function(){
		if visible {
			_icon_display()
			draw_rect(x,y+32,x+(progress*0.32),y+34,c_red, false)
			if notification == true {
				draw_sprite(exc_spr, 0, x+width-8, y-8)
			}
		}
	}
//methods
	populate = function(){
		working_recepie = -1
		for(var rep=0; rep<array_length(recepies); rep++){
			var enough = true
			for(var inp=0; inp<array_length(recepies[rep].inputs); inp++){
				recepies[rep].inputs[inp].here = noone
				if array_length(children) = 0 {
					enough = false
				} else {
					for(var ch=0; ch<array_length(children); ch++){
						if children[ch].inner_text == recepies[rep].inputs[inp].name {
							recepies[rep].inputs[inp].here = children[ch]
						}
					}
					for(var ch=0; ch<array_length(children); ch++){
						if recepies[rep].inputs[inp].here == noone {
							enough = false
						} else {
							if recepies[rep].inputs[inp].here.count < recepies[rep].inputs[inp].need {
								enough = false
							}
						}
					}
				}
			}
			if enough {
				working_recepie = rep
			}
		}
	}
	build = function(){
		if working_recepie == -1 {
			progress = 0
		} else {
			var rate = 0
			for (var in = 0; in < array_length(recepies[working_recepie].inputs); in++){
				rate = floor(recepies[working_recepie].inputs[in].here.count/recepies[working_recepie].inputs[in].need)
			}
			//if rate > count {
			//	rate = count
			//}
			if progress < 100 {
				progress += (100/recepies[working_recepie].steps)*rate
			} else {
				progress = 0
				notification = true
				complete()
				
			}
		}
	}
	addrecepies = function(){
		var rec_string = inner_text+": "
		for (var in = 0; in < array_length(recepies[working_recepie].inputs); in++){
			rec_string += recepies[working_recepie].inputs[in].name
			rec_string += " x"
			rec_string += string(recepies[working_recepie].inputs[in].need)
			rec_string += ", "
		}
		rec_string += "= "
		for (var out = 0; out < array_length(recepies[working_recepie].outputs); out++){
			rec_string += recepies[working_recepie].outputs[out].name
			rec_string += " x"
			rec_string += string(recepies[working_recepie].outputs[out].count)
			rec_string += ", "
		}
		rec_string += ";\n"
		if array_find_index(core.known_recepies, rec_string) == -1 {
			array_push(core.known_recepies, rec_string)
		}
	}
	complete = function(){
		for (var in = 0; in < array_length(recepies[working_recepie].inputs); in++){
			if recepies[working_recepie].inputs[in].consumable == true {
				recepies[working_recepie].inputs[in].here.count -= recepies[working_recepie].inputs[in].need
			}
		}
		for (var out = 0; out < array_length(recepies[working_recepie].outputs); out++){
			recepies[working_recepie].outputs[out].here = noone
			for (var ch = 0; ch < array_length(children); ch++){
				if children[ch].inner_text == recepies[working_recepie].outputs[out].name {
					recepies[working_recepie].outputs[out].here = children[ch]
				}
			}
			if recepies[working_recepie].outputs[out].here == noone {
				var new_item = core.newicon(x, y, recepies[working_recepie].outputs[out].name, recepies[working_recepie].outputs[out].count)
				self.link(new_item)
			} else {
				recepies[working_recepie].outputs[out].here.count += recepies[working_recepie].outputs[out].count
			}
		}
	}
}