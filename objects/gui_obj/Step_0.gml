boxes = [];

var width = window_get_width();
var col_size = width / (len(icons) + 1);
var x_pos = 0;

for(var i = 0; i < len(icons); i++) {
	x_pos += col_size;

		var box_length = max(sprite_get_width(icons[i]), sprite_get_height(icons[i])) * box_ratio;
		append(boxes, [[x_pos - (box_length/2), v_pad - (box_length/2)],
					   [x_pos + (box_length/2), v_pad + (box_length/2)]]);
}
if (device_mouse_check_button(0, mb_left)) {
	for(var i = 0; i < len(boxes); i++) {
		var box = boxes[i];
		var mouse = [device_mouse_raw_x(0), device_mouse_raw_y(0)];
		if(point_in_rectangle(mouse[0], mouse[1],
							  box[0][0], box[0][1], box[1][0], box[1][1])) {
			selected = icons[i];
		}
	}
}