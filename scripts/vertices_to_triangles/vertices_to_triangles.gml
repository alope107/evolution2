function vertices_to_triangles(vertices){
	var triangles = [];
	
	triangles[0] = [vertices[0], vertices[1], vertices[2]];
	for (var i=3; i < len(vertices); i++) {
		var point = vertices[i];
		var other_points = closest_points(point, slice(vertices, 0, i));
		var triangle = [point, other_points[0], other_points[1]];
		triangles[i-2] = sort_clockwise(triangle, false);
	}
	 return triangles;
}

function closest_points(point, other_points) {
	other_points = deep_array_copy(other_points);
	array_sort(other_points, method({extra_pt: point}, function (a, b) {
		return point_distance(a[0], a[1], extra_pt[0], extra_pt[1]) -
			   point_distance(b[0], b[1], extra_pt[0], extra_pt[1]);
	}));
	return [other_points[0], other_points[1]];
}