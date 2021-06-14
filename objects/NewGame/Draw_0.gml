draw_self()
draw_text_outlined(x+(sprite_width/2),y+sprite_height,"New Game",c_lime,c_black)
for(i=0;i<array_length(saves);i++){
	saves[i].draw()
}