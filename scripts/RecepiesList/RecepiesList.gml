function RecepiesList(_x, _y, _parent, _inner_text) : TextContainer(_x, _y, _parent, _inner_text) constructor {
//vars
//system
//methods
//on_create
	inner_text = ""
	for(var k=ds_map_find_first(core.recepies); !is_undefined(k); k = ds_map_find_next(core.recepies, k)){
		for (var r=0; r<array_length(core.recepies[? k]); r++){
			inner_text += "{"
			inner_text += k
			inner_text += ": "
			for (var i=0; i<array_length(core.recepies[? k][r].inputs); i++){
				inner_text += core.recepies[? k][r].inputs[i].name
				inner_text += " x"
				inner_text += string(core.recepies[? k][r].inputs[i].need)
				inner_text += ", "
			}
			inner_text += " = "
			for (var i=0; i<array_length(core.recepies[? k][r].outputs); i++){
				inner_text += core.recepies[? k][r].outputs[i].name
				inner_text += " x"
				inner_text += string(core.recepies[? k][r].outputs[i].count)
				inner_text += ", "
			}
			inner_text += "};\n"
		}
	}
}