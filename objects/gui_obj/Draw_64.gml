if(enabled) {
	var width = window_get_width();

	var col_size = width / (len(icons) + 1);
	var x_pos = 0;
	for(var i = 0; i < len(icons); i++) {
		x_pos += col_size;
		draw_sprite(icons[i], 0, x_pos, v_pad);
		if(icons[i] == selected) {
			var box = boxes[i];
			draw_rectangle_outline(box[0], box[1], c_red, 3);
		}
	}
}