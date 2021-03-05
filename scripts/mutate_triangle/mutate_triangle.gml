function mutate_triangle(triangle, std_dev_mod, min_angle) {
	// Mutates a given triangle.
	// Adds normal noise with the given standard deviation modifier.
	// Ensures that the smallest angle is at least the given number of degrees.
	// Returns the points in clockwise order and with the centroid at the origin.

	var mut_triangle, valid, angles;

	valid = false;
	while (!valid) {
	    for (var i = 0; i < 3; i++) {
	        for (var j = 0; j < 2; j++) {
	            mut_triangle[i, j] = triangle[i, j] + 
	                                 rand_norm(0, triangle[i, j] / std_dev_mod);
	        }
	    }
		valid = true;
		try {
			angles = inner_angles(mut_triangle);
		} catch (_exception) {
			// Some issues (e.g. collinear points) will cause inner_angles
			// to throw an exception. If this happens, it's not a valid triangle.
			valid = false;
			continue;
		}
	    
	    for (i= 0; i < 3; i++) {
	        valid = valid && (angles[i] >= min_angle); 
	    }
	}

	mut_triangle = sort_clockwise(mut_triangle, true);

	return mut_triangle;



}
