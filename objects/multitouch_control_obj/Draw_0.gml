if(multitouch_active) {
	draw_set_color(c_black);
} else {
	draw_set_color(c_white);
}
for (var i = 0; i < 2; i++) {
	if(device_mouse_check_button(i, mb_left)) {
		draw_text(device_mouse_x(i), device_mouse_y(i) - 70, string(raw_x[i]) + ", " + string(raw_y[i]))
		draw_circle(device_mouse_x(i), device_mouse_y(i), 50, false);
	}
}