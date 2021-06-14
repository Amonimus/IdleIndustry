function TextWindow (_x, _y, _parent, _inner_text) : Window(_x, _y, _parent) constructor {
//on_create
	textbox = new TextContainer(x, y, self, _inner_text)
	array_push(elements, textbox)
	array_push(core.gui_layer, textbox)
}