if (!isChild && !initialized) {
    m = base_phenotype();
    
    body_coord = random_triangle(32, 15);
    
    perturb = true;
    if (perturb) {
        m.max_swim_strength  += rand_norm(0, m.max_swim_strength/2);
		m.max_steering_strength  += rand_norm(0, m.max_steering_strength/2);
		m.eagerness  += rand_norm(0, m.eagerness/2);
		m.color_pref += rand_norm(0, m.color_pref/2);
		m.wall_discouragement += rand_norm(0, m.wall_discouragement/2);
		m.eye_white_scale += rand_norm(0, m.eye_white_scale/3);
		m.pupil_scale += rand_norm(0, m.pupil_scale/3);
    }
    
    // RGB components of its color.
    r = random(255);
    g = random(255);
    b = random(255);
    
    // generation
    gen = 0;
}

if (!initialized) {
	fix = create_polygon_fix(body_coord);
    
	physics_fixture_set_density(fix, .3)//.5);
	physics_fixture_set_restitution(fix, 1);
	physics_fixture_set_collision_group(fix, 0);
	physics_fixture_set_linear_damping(fix, 1.2);
	physics_fixture_set_angular_damping(fix, .5);
	physics_fixture_set_friction(fix, .01);

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
	max_energy = 4 /*3*/ * m.starting_energy;

	energy = m.starting_energy;
	image_blend = make_colour_rgb(r, g, b);
	phy_rotation = random(360);
	initialized = true;

	// How large of a bite is taken. TODO: Proportional to the area.
	bite_scale = area / 200; //1

	tail_frame = 0;
	tail_frame_length = 20;
	tail_frame_progress = 0;
}

/* */
/*  */
