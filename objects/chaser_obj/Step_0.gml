if (initialized) { 
    reselect += 1;
    
    if (reselect > reselect_limit) {
        target_info = select_target();
        reselect = 0;
    }
    
	// Select a target if we've never selected one before or
	// if our previous target no longer exists
    if (target == -2 || (target_info.found && !instance_exists(target))) {
        target_info = select_target();
    }
	
	target = target_info.target
    
	// Currently just sets target coords to 0,0 if no viable target
	// TODO: Don't move if no target?
    if (!target_info.found) {
        target_coords = [0, 0];
    }
    else {
        target_coords = [target.x, target.y];
		if (target_info.afraidOf) {
			target_coords = mirror_point([x, y], target_coords);
		}
    }
    
    dir = point_direction(x, y, target_coords[0], target_coords[1]);
    dist = point_distance(x, y, target_coords[0], target_coords[1]);
    
    rel_dir = dir + phy_rotation;
    // If it is sufficiently far away, swim as fast as possible.
    // If it is close to the target, ease up so as not to overshoot.
	// TODO: Change logic if afraid?
    swim_strength = min(m.max_swim_strength, dist * m.eagerness);
    
    if(instance_number(food_obj) == 0) {
        swim_strength = 0;
    }
    
    dx = dcos(rel_dir) * swim_strength;
    dx = max(dx, 0);
    dy = dsin(rel_dir) * m.max_steering_strength;
    
    // Manual control
    if (chosen && global.controlling) {
        dx = 0;
        dy = 0;
        if (keyboard_check(vk_up)) {
            dx = m.max_swim_strength;
        }
        if ( keyboard_check(vk_left) && ! keyboard_check(vk_right)) {
            dy = m.max_steering_strength;
        }
        if ( keyboard_check(vk_right) && ! keyboard_check(vk_left)) {
            dy = -1 * m.max_steering_strength;
        }
    }
    
    physics_apply_local_force(tail_loc[0], tail_loc[1], dx, dy);
    
    // The faster you swim, the faster you fade.
    energy -= abs(swim_strength);
    // But you always lose at least your basal.
    energy -= basal;
    
    tail_frame_progress += swim_strength;
    if (tail_frame_progress > tail_frame_length) {
        tail_frame++;
        if (tail_frame > sprite_get_number(tail_spr)) {
            tail_frame = 0;
        }
        tail_frame_progress = 0;
    }
    
    // As it starves, its alpha goes to zero.
    // Alpha is scaled on starting energy, anything above starting energy
    // has alpha of 1.
    image_alpha = min(1, energy/m.starting_energy);
    
    if (energy > birthing_threshold) {
        child = instance_create(x, y, chaser_obj);
        child.isChild = true;

		child.m = perturb_genome(m, child_perturb_scale(), child_bounds());
        
        child.body_coord = mutate_triangle(body_coord, 9, 15);
        
        color_variation = 10;
        child.r = r + max(min(rand_norm(0, color_variation), 255), 0);
        child.g = g + max(min(rand_norm(0, color_variation), 255), 0);
        child.b = b + max(min(rand_norm(0, color_variation), 255), 0);
        
        energy /= 2;
        child.starting_energy = energy;
        
        child.gen = gen + 1;
    }
    
    if (energy < 0) {
        to_destroy = true;
    } 
}

