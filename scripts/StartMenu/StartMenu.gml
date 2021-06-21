function StartMenu(_x, _y) : Button(_x, _y) constructor {
//vars
	inner_text = "Menu"
	subbuttons = []
	open = false
//system
	step = function(){
		_startmenu()
	}
	_startmenu = function(){
		_button()
		snap_corner()
		if missed(){
			var test = 0
			for (var sb=0; sb<array_length(subbuttons); sb++){
				test += subbuttons[sb].missed()
			}
			if test == array_length(subbuttons){
				hide_subbuttons()
			}
		}
	}
//methods
	click_action = function(){
		if !open {
			show_subbuttons()
		} else {
			hide_subbuttons()
		}
	}
	snap_corner = function(){
		x = 0
		y = room_height-height
		for (var sb=0; sb<array_length(subbuttons); sb++){
			subbuttons[sb].x = x
			subbuttons[sb].y = y-(17*(sb+1))
		}
	}
	show_subbuttons = function(){
		for (var sb=0; sb<array_length(subbuttons); sb++){
			core.add_element(core.gui_layer, subbuttons[sb])
		}
		open = true
	}
	hide_subbuttons = function(){	
		for (var sb=0; sb<array_length(subbuttons); sb++){			
			core.destroy(subbuttons[sb])
		}		
		open = false
	}
//on_create
	array_push(subbuttons, new Shutdown(-64, -64))
	array_push(subbuttons, new QuestButton(-64, -64))
	array_push(subbuttons, new RecepiesButton(-64, -64))
	array_push(subbuttons, new Button(-64, -64, "Options"))
	array_push(subbuttons, new Fullscreen(-64, -64))
	array_push(subbuttons, new Resolution(-64, -64, 640, 320))
	array_push(subbuttons, new Resolution(-64, -64, 640, 640))
	array_push(subbuttons, new Resolution(-64, -64, 960, 640))
	array_push(subbuttons, new Resolution(-64, -64, 960, 960))
	array_push(subbuttons, new Resolution(-64, -64, 1280, 960))
	array_push(subbuttons, new Resolution(-64, -64, 1600, 960))
	array_push(subbuttons, new VolumeButton(-64, -64))
}