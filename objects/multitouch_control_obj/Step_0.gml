multitouch_active = device_mouse_check_button(0, mb_left) && device_mouse_check_button(1, mb_left)
x_view = camera_get_view_x(view_camera[0])
y_view = camera_get_view_y(view_camera[0])
w_view = camera_get_view_width(view_camera[0])
h_view = camera_get_view_height(view_camera[0])
w_camera_scale = view_wport[0] / w_view
h_camera_scale = view_hport[0] / h_view

show_debug_message(string(w_camera_scale) + "..." + string(h_camera_scale))

raw_x0 = device_mouse_raw_x(0)
raw_y0 = device_mouse_raw_y(0)

// Second device is messed up "raw" actually gives loc in room
// Manually unscrew it
raw_x1 = (device_mouse_raw_x(1) - x_view) * w_camera_scale
raw_y1 = (device_mouse_raw_y(1) - y_view) * h_camera_scale

raw_x = [raw_x0, raw_x1]
raw_y = [raw_y0, raw_y1]


dist = point_distance(raw_x0, raw_y0, raw_x1, raw_y1)

if (!is_scrolling) {
	if (multitouch_active) {
		is_scrolling = true
		old_dist = dist
	}
} else { // if we are scrolling
	if (multitouch_active) {
		// Update camera position, following first device
		dx = (last_x - raw_x0) / w_camera_scale
		dy = (last_y - raw_y0) / h_camera_scale
		
		camera_set_view_pos(view_camera[0], max(x_view + dx, 0), max(y_view + dy, 0))
		
		//Update camera zoom based on pinch if we've sufficiently scaled
		if (abs(dist - last_dist) > 10) {
			// HEURISTIC
			// Idk how to properly scale
			dist_scale = power(dist/old_dist, .03)
			camera_set_view_size(view_camera[0], w_view * dist_scale, h_view*dist_scale)
		}
	} else { // no longer both touching, end scroll
		is_scrolling = false
	}
}
last_x = raw_x0
last_y = raw_y0
last_dist = dist