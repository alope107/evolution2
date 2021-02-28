function extra_triangle(current_triangles, scale, min_angle){
	// TODO: don't make whole extra triangle for just one point
	var extra_pt = random_triangle(32, 15)[0];
	var other_points = unique(flatten(current_triangles));
	array_sort(other_points, method({extra_ptz: extra_pt}, function (a, b) {
		return point_distance(a[0], a[1], extra_ptz[0], extra_ptz[1]) -
			   point_distance(b[0], b[1], extra_ptz[0], extra_ptz[1]);
	}));
	var triangle = [other_points[0], other_points[1], extra_pt];
	triangle = sort_clockwise(triangle, false);
	return triangle;
}