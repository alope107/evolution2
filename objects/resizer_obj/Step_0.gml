if (browser_width != last_browser_width || browser_height != last_browser_height) {
	// Check whether this is the first sizing or a resize
	if (last_browser_width == -1) {
		canvas_fullscreeen(true);
	}
	else {
		canvas_fullscreeen(false);
	}
}
last_browser_width = browser_width;
last_browser_height = browser_height;