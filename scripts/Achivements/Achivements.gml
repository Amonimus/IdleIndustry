function Achievements(_x, _y) : GameObject(_x, _y) constructor {
//vars
	levels = [
		{music: Stage1_bgm, goals: [], rewards: []},
		{music: Stage2_bgm, goals: [], rewards: [
			{name: "Axe Blueprint", count: 1},
			{name: "Pickaxe Blueprint", count: 1},
			{name: "Coal Mine Blueprint", count: 1},
			{name: "Torch Blueprint", count: 1},
			{name: "Spear Blueprint", count: 1},
			{name: "Helptext2", count: 1},
		]},
		{music: Stage3_bgm, goals: [], rewards: [
			{name: "Hut Blueprint", count: 1},
			{name: "Storage Blueprint", count: 1},
			{name: "Crafting Bench Blueprint", count: 1},
		]},	
	]
//system
	step = function(){
		for (var object=0; object<array_length(core.desktop_layer); object++){
			var test_obj = core.desktop_layer[object]
			if test_obj.object_type == "Icon" {
				if test_obj.inner_text = "Hut" and test_obj.count > 2 {
					show_message("WIN")
				}
			}
		}
	}
//methods

//on_create
}