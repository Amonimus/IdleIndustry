function TextWindow (_x, _y, _parent, _inner_text) : Window(_x, _y, _parent) constructor {
//on_create
	if _inner_text == "Recepies" {
		textbox = new RecepiesList(x, y, self, _inner_text)
	} else if _inner_text == "Quests" {
		textbox = new QuestsList(x, y, self, _inner_text)
	} else {
		textbox = new TextContainer(x, y, self, _inner_text)
	}
	array_push(elements, textbox)
	array_push(core.gui_layer, textbox)
}