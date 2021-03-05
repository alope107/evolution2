function triangle_incenter(triangle, side_lengths) {
	// Returns the incenter of the triangle.

	var sides, perimeter, incenter;

	incenter[0] = 0;
	incenter[1] = 0;

	perimeter = 0;
	for (i = 0; i < 3; i++) {
	    perimeter += side_lengths[i];
	    for (j = 0; j < 2; j++) {
	        incenter[j] += triangle[i, j] * side_lengths[i];
	    }
	}

	incenter[0] /= perimeter;
	incenter[1] /= perimeter;

	return incenter;





}
