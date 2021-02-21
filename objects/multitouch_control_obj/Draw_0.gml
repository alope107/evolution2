if(multitouch_active) {
	draw_set_color(c_black);
	mid_abs = relative_to_absolute(mid_relative, 0, 0);
	draw_circle(mid_abs[0], mid_abs[1], 5, false);
} else {
	draw_set_color(c_white);
}
for (var i = 0; i < 2; i++) {
	if(device_mouse_check_button(i, mb_left)) {
		draw_text(device_mouse_x(i), device_mouse_y(i) - 70, string(device_relative[i][0]) + ", " + string(device_relative[i][1]))
		draw_circle(device_mouse_x(i), device_mouse_y(i), 30, false);
	}
}
