function GameCore() constructor {
//vars
	settings = {volume: true, x_resolution: 960, y_resolution: 640, fullscreen: true}
	cursor = noone
	cursor_layer = []
	hold_layer = []
	gui_layer = []
	window_layer = []
	desktop_layer = []
	hidden_layer = []
	objects = [desktop_layer, window_layer, gui_layer, hold_layer, cursor_layer]
	icons = ds_map_create()
	recepies = ds_map_create()
	strings = ds_map_create()
	goals = []
//system
	step = function(){
		if first_step {
			on_create()
			first_step = false
		}
		for (var i=0; i<array_length(objects); i++){
			for (var j=0; j<array_length(objects[i]); j++){
				objects[i][j].step()
			}
		}
		if !audio_is_playing(Stage1_bgm) {
			audio_play_sound(Stage1_bgm, 0, true)
		}
	}
	draw = function(){
		for (var i=0; i<array_length(objects); i++){
			for (var j=0; j<array_length(objects[i]); j++){
				objects[i][j].draw()
			}
		}
	}
//methods
	add_element = function(layer, element){
		array_push(layer, element)
	}
	move_layer = function(element, layer){
		destroy(element)
		add_element(layer,element)
	}
	destroy = function(obj){
		array_remove(find_in_layers(obj), obj)
	}
	find_in_layers = function(obj){
		for (var i=0; i<array_length(objects); i++){
			e = array_find_index(objects[i], obj)
			if e != -1 {
				return objects[i]
			}
		}
		return -1
	}
	changeScreen = function(w, h, hard){
		if hard {
			settings.x_resolution = w
			settings.y_resolution = h
		}
		room_width = settings.x_resolution
		room_height = settings.y_resolution
		window_set_size(room_width, room_height)
		surface_resize(application_surface,room_width,room_height)
	}
	fullscreen = function(hard){
		if hard {
			var get = !window_get_fullscreen()
			settings.fullscreen = get
		}
		window_set_fullscreen(settings.fullscreen)	
		window_set_size(room_width, room_height)
		surface_resize(application_surface,room_width,room_height)
	}
	volume = function(hard){
		if hard {
			settings.volume = !settings.volume
		}
		audio_master_gain(settings.volume)
	}
	readfile = function(_filename){
		var _file = file_text_open_read(working_directory + _filename)
		var _string = ""
		while (!file_text_eof(_file)){
			_string += file_text_readln(_file)
		}
		file_text_close(_file)
		var _data = json_parse(_string)
		return _data
	}
	LoadResources = function(){
		var _data = readfile("icons.json")
		for (i=0; i<array_length(_data); i++){
			ds_map_add(icons, _data[i].name, _data[i])
		}
	}
	LoadRecepies = function(){
		var _data = readfile("recepies.json")
		for (i=0; i<array_length(_data); i++){
			for (j=0; j<array_length(_data[i].recepies); j++){
				for (k=0; k<array_length(_data[i].recepies[j].inputs); k++){
					_data[i].recepies[j].inputs[k].here = noone
				}
				for (k=0; k<array_length(_data[i].recepies[j].outputs); k++){
					_data[i].recepies[j].outputs[k].here = noone
				}
			}
			ds_map_add(recepies, _data[i].name, _data[i].recepies)
		}
	}
	LoadStrings = function(){
		var _data = readfile("strings.json")
		for (i=0; i<array_length(_data); i++){
			ds_map_add(strings, _data[i].name, _data[i])
		}
	}
	LoadGoals = function(){
		var _data = readfile("goals.json")
		for (i=0; i<array_length(_data); i++){
			_data[i].current = 0
		}
		goals = _data
	}
	LoadGame = function(){
		if file_exists("SAV"+string(global.current_game_id)+".sav") {
			var _filename = "SAV"+string(global.current_game_id)+".sav"
		} else {
			var _filename = "default.sav"
			while file_exists("SAV"+string(global.current_game_id)+".sav") or global.current_game_id < 0 {
				global.current_game_id++
			}
		}
		var _data = readfile(_filename)
		settings = _data.settings
		changeScreen(settings.x_resolution, settings.y_resolution, false)
		fullscreen(false)
		volume(false)
		timer.time = _data.time
		for (i=0; i<array_length(_data.icons); i++){
			var _icon = _data.icons[i]
			_icon.here = newicon(_icon.x, _icon.y, _icon.name, _icon.count)
			if _icon.parent != noone {
				_data.icons[_icon.parent].here.link(_icon.here)
			}
		}
	}
	SaveGame = function(){
		var _icons = []
		var _id = 1
		var _temp = []
		for (var i=0; i<array_length(objects); i++){
			for (var j=0; j<array_length(objects[i]); j++){
				var object = objects[i][j]
				array_push(_temp, object)
				if object.object_type = "Icon" {
					array_push(_icons, {id: _id, name: object.inner_text, x: object.x, y: object.y, count: object.count, parent: object.parent})
					_id++
				}
			}
		}
		for (var i=0; i<array_length(_icons); i++){
			if _icons[i].parent != noone {
				for (var j=0; j<array_length(_temp); j++){
					if _temp[j] == _icons[i].parent {
						 _icons[i].parent = j
					}
				}
			}
		}
		var _save = {settings: settings, icons: _icons, time: timer.time}
		var _data = json_stringify(_save)
		var _buffer = buffer_create(string_byte_length(_data)+1, buffer_fixed, 1)
		buffer_write(_buffer, buffer_string, _data)
		buffer_save(_buffer, "SAV"+string(global.current_game_id)+".sav")
		buffer_delete(_buffer)
	}
	newicon = function(_x, _y, _name, _count){
		if ds_map_exists(icons, _name){
			var new_class = icons[? _name].class
		} else {
			var new_class = "Resource"
		}
		switch(new_class){
			case "Text":
				var _icon = new TextIcon(_x, _y, _name, _count)
				break
			case "Resource":
				var _icon = new Icon(_x, _y, _name, _count)
				break
			case "Container":
				var _icon = new ContainerIcon(_x, _y, _name, _count)
				break
			case "Factory":
				var _icon = new FactoryIcon(_x, _y, _name, _count)
				break
			case "Action":
				var _icon = new Icon(_x, _y, _name, _count)
				break
			default:
				var _icon = new Icon(_x, _y, _name, _count)
				break
		}
		add_element(desktop_layer, _icon)
		return _icon
	}
//on_create
	on_create = function(){
		audio_group_load(SFX)
		audio_group_load(BGM)
		cursor = new Cursor(64, 64)
		timer = new Timer(32, 64)
		add_element(cursor_layer, cursor)
		add_element(gui_layer, new StartMenu(32, 64))
		add_element(gui_layer, new Achievements(0, 0))
		add_element(gui_layer, timer)
		add_element(gui_layer, new Logo(512, 0))
		LoadResources()
		LoadRecepies()
		LoadStrings()
		LoadGoals()
		LoadGame()
	}
	first_step = true
}