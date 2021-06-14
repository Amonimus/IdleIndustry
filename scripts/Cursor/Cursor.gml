function Cursor(_x, _y) : GameObject(_x, _y) constructor {
//vars
	sprite = cursor_spr
	drag_object = noone
	drag_candidates = []
//system
	step = function(){
		x = mouse_x
		y = mouse_y
		if mouse_check_button_pressed(mb_left){
			audio_play_sound(Click_snd, 0, false)
		}
		select()
	}
//methods
	pick = function(obj){
		if array_find_index(drag_candidates,obj) == -1 {
			array_push(drag_candidates, obj)
		}
	}
	select = function(){
		if drag_object == noone and array_length(drag_candidates) > 0 {
			drag_object = drag_candidates[array_length(drag_candidates)-1]
			drag_candidates = []
			drag_object.dragging = true
			drag_object.original_layer = core.find_in_layers(drag_object)
			core.move_layer(drag_object, core.hold_layer)
		}
	}
	release = function(obj){
		if drag_object == obj {
			drag_object.dragging = false
			drag_object = noone
			core.move_layer(obj, obj.original_layer)
		}
	}	
//on_create
}