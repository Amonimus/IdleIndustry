function QuestButton(_x, _y) : Button(_x, _y) constructor {
//vars
	inner_text = "Quests"
	wnd = noone
//methods
	click_action = function(){
		if wnd == noone {
			wnd = new TextWindow(64, 64, self, "Quests")
			array_push(core.window_layer, wnd)
		}
	}
}