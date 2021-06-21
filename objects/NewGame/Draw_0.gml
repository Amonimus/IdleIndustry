draw_self()
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_text_outlined(x+(sprite_width/2),y+sprite_height, 400, "New Game",c_lime,c_black)
for(i=0;i<array_length(saves);i++){
	saves[i].draw()
}