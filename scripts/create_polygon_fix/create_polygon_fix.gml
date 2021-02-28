function create_polygon_fix(points) {
	// Creates a polygon fixture from a 2D array of points.
	// Points must be ordered clockwise and be non-concave.

	fix = physics_fixture_create();
	physics_fixture_set_polygon_shape(fix);

	// Add points to fixture in clockwise order.
	for (i = 0; i < len(points); i++) {
	    physics_fixture_add_point(fix, points[i][0], points[i][1]);
	}

	return fix;
}
