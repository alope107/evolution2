function rotate_point(x_pt, y_pt, theta) {
	// Rotates a point by theta degrees.

	var new_point;
	var cosine = dcos(theta);
	var sine = dsin(theta);
	

	new_point[0] = x_pt * cosine - y_pt * sine;
	new_point[1] = y_pt * cosine + x_pt * sine;

	return new_point;
}
