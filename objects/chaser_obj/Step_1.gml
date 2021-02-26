if (!isChild && !initialized) {
    body_coord = random_triangle(32, 15);

	m = perturb_genome(base_phenotype(), base_perturb_scale(), base_bounds())
    
    // RGB components of its color.
    r = random(255);
    g = random(255);
    b = random(255);
    
    // generation
    gen = 0;
}

if (!initialized) {
	//fix = create_polygon_fix(body_coord);
    
	//physics_fixture_set_density(fix, .3);
	//physics_fixture_set_restitution(fix, 1);
	//physics_fixture_set_collision_group(fix, 0);
	//physics_fixture_set_linear_damping(fix, 1.2);
	//physics_fixture_set_angular_damping(fix, .5);
	//physics_fixture_set_friction(fix, .01);
	
	var fix = create_chaser_fix(body_coord);
	bound_fix = physics_fixture_bind(fix, self);
	physics_fixture_delete(fix);

	area = triangle_area(body_coord);
	inradius = triangle_inradius(body_coord);
	side_lengths = triangle_side_lengths(body_coord);

	tail_loc = tail_coord(body_coord);

	white_radius = m.eye_white_scale * inradius;
	pupil_radius = m.pupil_scale * white_radius;

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
	bite_scale = area / 200;

	tail_frame = 0;
	tail_frame_length = 20;
	tail_frame_progress = 0;
}