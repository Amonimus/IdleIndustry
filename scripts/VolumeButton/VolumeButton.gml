function VolumeButton(_x, _y) : Button(_x, _y) constructor{
//vars
	inner_text = "Volume"
//methods
	click_action = function(){
		core.volume(true)
	}
}