function FactoryIcon(_x, _y, _inner_text, _count) : ContainerIcon(_x, _y, _inner_text, _count) constructor {
//vars
	progress = 0
	notification = false
	recepies = core.recepies[? inner_text]
	working_recepie = noone
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
		working_recepie = noone
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
				working_recepie = recepies[rep]
			}
		}
	}
	build = function(){
		if working_recepie == noone {
			progress = 0
		} else {
			var rate = 0
			for (var in = 0; in < array_length(working_recepie.inputs); in++){
				rate = floor(working_recepie.inputs[in].here.count/working_recepie.inputs[in].need)
			}
			if rate > count {
				rate = count
			}
			if progress < 100 {
				progress += (100/working_recepie.steps)*rate
			} else {
				progress = 0
				notification = true
				complete()
			}
		}
	}
	complete = function(){
		if working_recepie != noone {
			for (var in = 0; in < array_length(working_recepie.inputs); in++){
				if working_recepie.inputs[in].consumable == true {
					working_recepie.inputs[in].here.count -= working_recepie.inputs[in].need
				}
			}
			for (var out = 0; out < array_length(working_recepie.outputs); out++){
				for (var ch = 0; ch < array_length(children); ch++){
					if children[ch].inner_text == working_recepie.outputs[out].name {
						working_recepie.outputs[out].here = children[ch]
					}
				}
				if working_recepie.outputs[out].here == noone {
					var new_item = core.newicon(x, y, working_recepie.outputs[out].name, working_recepie.outputs[out].count)
					self.link(new_item)
				} else {
					working_recepie.outputs[out].here.count += working_recepie.outputs[out].count
				}
			}
		}
	}
}