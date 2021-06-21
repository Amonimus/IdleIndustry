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
		for (var g=0; g<array_length(core.progress.goals); g++){
			for (var i=0; i<array_length(core.progress.goals[g].inputs); i++){
				if !core.progress.goals[g].complete {
					core.progress.goals[g].inputs[i].current = 0
					for (var l=0; l<array_length(core.objects); l++){
						for (var ob=0; ob<array_length(core.objects[l]); ob++){
							var test_obj = core.objects[l][ob]
							if test_obj.object_type == "Icon" {
								if test_obj.inner_text = core.progress.goals[g].inputs[i].name {
									core.progress.goals[g].inputs[i].current += test_obj.count
								}
							}
						}
					}
				}
			}
		}
		for (var g=0; g<array_length(core.progress.goals); g++){
			if !core.progress.goals[g].complete {
				for (var i=0; i<array_length(core.progress.goals[g].inputs); i++){
					if core.progress.goals[g].inputs[i].current >= core.progress.goals[g].inputs[i].need {
						for (var o=0; o<array_length(core.progress.goals[g].outputs); o++){
							core.newicon(96+32*o,96,core.progress.goals[g].outputs[o].name,core.progress.goals[g].outputs[o].count)
						}
						core.progress.goals[g].complete = true
					}
				}
			}
		}
	}
//methods
//on_create
}