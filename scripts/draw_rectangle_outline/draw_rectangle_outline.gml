function draw_rectangle_outline(top_left, bottom_right, color, width){
	var bottom_left = [top_left[0], bottom_right[1]];
	var top_right = [bottom_right[0], top_left[1]];
	var lines = [
		//top
		[top_left, top_right],
		// bottom
		[bottom_left, bottom_right],
		// left
		[top_left, bottom_left],
		// right
		[top_right, bottom_right]
	];
	
	for(var i = 0; i < len(lines); i++) {
		var line = lines[i];
		draw_line_width_color(line[0][0], line[0][1],
							  line[1][0], line[1][1],
							  width,
							  color, color);
	}
}