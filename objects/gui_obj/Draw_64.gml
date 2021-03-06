if(enabled) {
	var width = window_get_width();

	var col_size = width / (len(icons) + 1);
	var x_pos = 0;
	for(var i = 0; i < len(icons); i++) {
		x_pos += col_size;
		draw_sprite(icons[i], 0, x_pos, v_pad);
		if(icons[i] == selected) {
			var box_length = max(sprite_get_width(selected), sprite_get_height(selected)) * box_ratio;
			draw_set_color(c_white);
			draw_rectangle(x_pos - (box_length/2), v_pad - (box_length/2),
						   x_pos + (box_length/2), v_pad + (box_length/2),
						   true);
		}
	}
}

//draw_set_color(c_red);
//draw_circle(40, 40, 20, true);