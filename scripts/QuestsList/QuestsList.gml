function QuestsList(_x, _y, _parent, _inner_text) : TextContainer(_x, _y, _parent, _inner_text) constructor {
//vars
//system
//methods
//on_create
	inner_text = ""
	for (var g=0; g<array_length(core.progress.goals); g++){
		inner_text += "{"
		for (var i=0; i<array_length(core.progress.goals[g].inputs); i++){
			inner_text += core.progress.goals[g].inputs[i].name
			inner_text += ":"
			inner_text += string(core.progress.goals[g].inputs[i].current)
			inner_text += "/"
			inner_text += string(core.progress.goals[g].inputs[i].need)
			inner_text += ", "
		}
		inner_text += "};\n"
	}
}