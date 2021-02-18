if (view_enabled) {
	_x = camera_get_view_x(view_camera[0]);
	_y = camera_get_view_y(view_camera[0]);
	_w = camera_get_view_width(view_camera[0]);
	_h = camera_get_view_height(view_camera[0]);
	
	rightmost = _x + _w;
	bottommost = _y + _h;
	
	// If our view extends beyond the room, clear the OOB areas
	if (rightmost >= room_width || bottommost >= room_height) {
		draw_set_color(c_black);
		draw_rectangle(room_width, 0, rightmost, bottommost, false);
		draw_rectangle(0, room_height, rightmost, bottommost, false);
	}
}