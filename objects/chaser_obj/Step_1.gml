if (!isChild && !initialized) {
    body_coord = [random_triangle(32, 15)];

	m = perturb_genome(base_phenotype(), base_perturb_scale(), base_bounds())
    
    // RGB components of its color.
    r = random(255);
    g = random(255);
    b = random(255);
    
    // generation
    gen = 0;
}

if (!initialized) {
	bound_fix = []
	area = []
	for(var i = 0; i < array_length(body_coord); i++) {
		print(body_coord[i]);
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

	total_area = sum(area)

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