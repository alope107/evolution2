function rotate_point(argument0, argument1, argument2) {
	// Rotates a point by theta degrees.

	var x_pt, y_pt, theta, new_point;

	x_pt = argument0;
	y_pt = argument1;
	theta = argument2; // How many degrees to rotate (counter-clockwise) by in degrees.

	//show_debug_message("Theta (deg): " + string(theta) + "  X: " + string(x_pt) + " Y: " + string(y_pt));
	//rad = degtorad(theta);
	//show_debug_message("Theta (rad): " + string(rad));

	new_point[0] = x_pt * dcos(theta) - y_pt * dsin(theta);
	new_point[1] = y_pt * dcos(theta) + x_pt * dsin(theta);

	return new_point;
}
