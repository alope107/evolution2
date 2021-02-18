function canvas_fullscreeen(){
	window_set_size(browser_width, browser_height);
	window_center();
	room_width = browser_width;
	room_height = browser_height;
	surface_resize(application_surface, browser_width, browser_height);
}