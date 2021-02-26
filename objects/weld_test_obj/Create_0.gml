show_debug_message("ahoy");
randomize();
//triangles =  [random_triangle(32, 15), random_triangle(32, 15)];
triangles =  [random_triangle(32, 15)];
colors = [make_color_rgb(random(255), random(255), random(255))];
show_debug_message("aboy");
for( var i = 1; i < 3; i++) { 
	extra_pt = random_triangle(32, 15)[0];
	show_debug_message("atoy");
	var other_points = unique(flatten(triangles));
	show_debug_message("agoy");
	show_debug_message(other_points);
	array_sort(other_points, function (a, b) {
		return point_distance(a[0], a[1], self.extra_pt[0], self.extra_pt[1]) -
			   point_distance(b[0], b[1], self.extra_pt[0], self.extra_pt[1]);
	});
	extra_triangle = [other_points[0], other_points[1], extra_pt];
	extra_triangle = sort_clockwise(extra_triangle, false);
	triangles[i] = extra_triangle;
	colors[i] = make_color_rgb(random(255), random(255), random(255));
}

show_debug_message("TRIANGLES " + string(triangles));

for (var i = 0; i < array_length(triangles); i++) {
	fix = create_polygon_fix(triangles[i]);
    
	physics_fixture_set_density(fix, .3)//.5);
	physics_fixture_set_restitution(fix, 1);
	physics_fixture_set_collision_group(fix, 0);
	physics_fixture_set_linear_damping(fix, 1.2);
	physics_fixture_set_angular_damping(fix, .5);
	physics_fixture_set_friction(fix, .01);

	bound_fix = physics_fixture_bind(fix, self);
	physics_fixture_delete(fix);
}
