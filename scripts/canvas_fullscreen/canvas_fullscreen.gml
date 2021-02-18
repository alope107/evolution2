/**
 * Resizes the game to fill the whole browser.
 * Updates canvas, surface, and viewport/camera.
 * @param {boolean} initial - Whether this is the first time this is called for a room
*/
function canvas_fullscreeen(initial){
	var _x_scale
	var _y_scale
	var _old_camera_width
	var _old_camera_height
	
	window_set_size(browser_width, browser_height);
	window_center();
	surface_resize(application_surface, browser_width, browser_height);
	if(view_enabled) {
		_x_scale = browser_width / view_wport[0];
		_y_scale = browser_height / view_hport[0];
		
		view_wport[0] = browser_width;
		view_hport[0] = browser_height;
		
		if (initial) {
			// The first time through have 1x1 scaling
			camera_set_view_size(view_camera[0], browser_width, browser_height);
		}
		else {
			// Subsequent times just match aspect ratio without changing zoom level
			show_debug_message("xscale: " + string(_x_scale) + " yscale " + string(_y_scale));
			_old_camera_width = camera_get_view_width(view_camera[0]);
			_old_camera_height = camera_get_view_height(view_camera[0]);
			camera_set_view_size(view_camera[0], 
								 _old_camera_width * _x_scale,
								 _old_camera_height * _y_scale);
		}
	}
}