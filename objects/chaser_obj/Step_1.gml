if (!isChild && !initialized) {
	vertices = random_triangle(32, 15);
	
	// TODO: Make dynamic based on genes
	for (var i = 3; i < global.max_vertices; i++) {
		var triangle_data = extra_triangle(vertices, 32, 15);
		vertices[i] = triangle_data.new_point;
	}

	m = perturb_genome(base_phenotype(), base_perturb_scale(), base_bounds())
    
    // RGB components of its color.
    r = random(255);
    g = random(255);
    b = random(255);
    
    // generation
    gen = 0;
}

if (!initialized) {
	body_coord = vertices_to_triangles(vertices);
	
	var all_lines = [];
	for(var i=0; i< len(body_coord); i++) {
		var triangle = body_coord[i];
		for(var j=0; j <3; j++) {
			for(var k=j+1; k<3; k++) {
				append(all_lines, [[triangle[j][0], triangle[j][1]],
									[triangle[k][0], triangle[k][1]]]);
			}
		}
	}
	
	deduped_lines = unrepeated_lines(all_lines);
	
	bound_fix = [];
	area = [];
	for(var i = 0; i < array_length(body_coord); i++) {
		var fix = create_chaser_fix(body_coord[i]);
		bound_fix[i] = physics_fixture_bind(fix, self);
		physics_fixture_delete(fix);
		
		area[i] = triangle_area(body_coord[i]);
		inradius[i] = triangle_inradius(body_coord[i]);
		side_lengths[i] = triangle_side_lengths(body_coord[i]);

		tail_loc[i] = tail_coord(body_coord[i]);
		
		white_radius[i] = m.eye_white_scale * inradius[i];
		pupil_radius[i] = m.pupil_scale * white_radius[i];
	}

	total_area = sum(area);

	// Basal metabolic rate - rate at which energy will decrease when at rest.
	basal = 10;
	// How much energy is replenished by eating food.
	food_energy = 7000;
	// Amount of energy required before a birth will occur.
	birthing_threshold =  21000;
	// The highest amount of energy it can have stored.
	max_energy = 4 * m.starting_energy;

	energy = m.starting_energy;
	image_blend = make_colour_rgb(r, g, b);
	phy_rotation = random(360);
	initialized = true;

	// How large of a bite is taken. Proportional to the area.
	bite_scale = total_area / 200;

	tail_frame = 0;
	tail_frame_length = 20;
	tail_frame_progress = 0;
}