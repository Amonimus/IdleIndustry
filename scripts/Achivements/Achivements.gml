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
		for (var g=0; g<array_length(core.goals); g++){
			for (var i=0; i<array_length(core.goals[g].inputs); i++){
				core.goals[g].inputs[i].current = 0
				for (var l=0; l<array_length(core.objects); l++){
					for (var ob=0; ob<array_length(core.objects[l]); ob++){
						var test_obj = core.objects[l][ob]
						if test_obj.object_type == "Icon" {
							if test_obj.inner_text = core.goals[g].inputs[i].name {
								core.goals[g].inputs[i].current += test_obj.count
							}
						}
					}
				}
			}
		}
		for (var g=0; g<array_length(core.goals); g++){
			for (var i=0; i<array_length(core.goals[g].inputs); i++){
				if core.goals[g].inputs[i].current >= core.goals[g].inputs[i].need {
					core.newicon(96,96,"Trophy",1)
				}
			}
		}
	}
//methods

//on_create
}