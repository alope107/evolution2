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
	
	var _width = 900;
	var _height = 900;
	
	if (!initial) {
		_width = window_get_width();
		_height = window_get_height();
	}
	
	window_set_size(_width, _height);
	//window_center();
	surface_resize(application_surface, _width, _height);
	if(view_enabled) {
		_x_scale = _width / view_wport[0];
		_y_scale = _height / view_hport[0];
		
		view_wport[0] = _width;
		view_hport[0] = _height;
		
		if (initial) {
			// The first time through have 1x1 scaling
			camera_set_view_size(view_camera[0], _width, _height);
		}
		else {
			// Subsequent times just match aspect ratio without changing zoom level
			show_debug_message("Yes, this is here");
			show_debug_message("xscale: " + string(_x_scale) + " yscale " + string(_y_scale));
			_old_camera_width = camera_get_view_width(view_camera[0]);
			_old_camera_height = camera_get_view_height(view_camera[0]);
			camera_set_view_size(view_camera[0], 
								 _old_camera_width * _x_scale,
								 _old_camera_height * _y_scale);
		}
	}
}