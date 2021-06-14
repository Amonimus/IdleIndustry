global.current_game_id = -1
saves = []
var save_id = 0
while file_exists("SAV"+string(save_id)+".sav"){
	var btn = new LoadButton(32+save_id*128, y+64, save_id)
	array_push(saves, btn)
	save_id++
}