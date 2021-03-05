function inner_angles(triangle) {
	// Returns the inner angles of a triangle (in degrees) given the coordinates.
	// The coordinates oughta be passed as a 2D array.
	var angles = [];

	var sides = triangle_side_lengths(triangle);

	// Use the sides to get the angles.
	for (var i = 0; i < 3; i++) {
	    // Selects each of the 3 sides, but cycles the order.
	    var a = sides[i];
	    var b = sides[(i + 1) mod 3];
	    var c = sides[(i + 2) mod 3];
    
	    var numerator = b*b + c*c - a*a;
	    var denominator = 2*b*c;
	    angles[i] = darccos(numerator / denominator);
	    angles[i] = normalize_degrees(angles[i]);
	}

	return angles;
}
