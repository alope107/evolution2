if(enabled) {
	var width = window_get_width();

	var col_size = width / (len(buttons) + 1);
	var x_pos = 0;
	for(var i = 0; i < len(buttons); i++) {
		x_pos += col_size;
		draw_sprite(buttons[i].spr, 0, x_pos, v_pad);
		if(buttons[i] == selected) {
			var box = boxes[i];
			draw_rectangle_outline(box[0], box[1], c_red, 3);
		}
	}
}