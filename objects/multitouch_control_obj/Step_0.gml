multitouch_active = device_mouse_check_button(0, mb_left) && device_mouse_check_button(1, mb_left);
camera_pos = get_camera_pos(0);
w_view = camera_get_view_width(view_camera[0]);
h_view = camera_get_view_height(view_camera[0]);
view_scale = get_view_scale(0, 0);

//show_debug_message(string(view_scale[0]) + "..." + string(view_scale[1]))
device_relative = [
	[device_mouse_raw_x(0), device_mouse_raw_y(0)],
	// Second device is messed up "raw" actually gives loc in room
	// Manually unscrew it
	absolute_to_relative([device_mouse_raw_x(1), device_mouse_raw_y(1)], 0, 0),
];

mid_relative = midpoint(device_relative[0], device_relative[1]);

// Distance on the screen between devices
dist = point_distance(device_relative[0][0], device_relative[0][1], 
					  device_relative[1][0], device_relative[1][1])

if (!is_scrolling) {
	if (multitouch_active) {
		is_scrolling = true;
		old_dist = dist;
		old_w_view = w_view
		old_h_view = h_view
	}
} else { // if we are scrolling
	if (multitouch_active) {
		// Update camera position, following first device
		dx = (last_relative[0][0] - device_relative[0][0]) / view_scale[0];
		dy = (last_relative[0][1] - device_relative[0][1]) / view_scale[1];
		
		camera_set_view_pos(view_camera[0], max(camera_pos[0] + dx, 0), max(camera_pos[1] + dy, 0));
		
		dist_scale = power(old_dist/dist, .5);
		camera_set_view_size(view_camera[0], old_w_view * dist_scale, old_h_view*dist_scale);
	} else { // no longer both touching, end scroll
		is_scrolling = false;
	}
}
last_relative = [
	[device_relative[0][0], device_relative[0][1]], 
	[device_relative[1][0], device_relative[1][1]],
];
last_dist = dist;