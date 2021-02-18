if (browser_width != last_browser_width || browser_height != last_browser_height) {
	canvas_fullscreeen()

	show_debug_message("Width " + string(browser_width) + 
					   " Height " + string(browser_height))
}
last_browser_width = browser_width
last_browser_height = browser_height