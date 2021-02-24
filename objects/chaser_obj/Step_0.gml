if (initialized) { 
    // Set desirability SO LOW that no one could ever want it.
    max_desirability = -9999999;
    
    reselect += 1;
    
    if (reselect > reselect_limit) {
        target = select_target();
        reselect = 0;
    }
    
    if (target == -2 || (target != -1 && !instance_exists(target))) {
        target = select_target();
    }
    
    if (target == -1) {
        target_x = 0;
        target_y = 0;
    }
    else {
        target_x = (target).x;
        target_y = (target).y;
    }
    
    dir = point_direction(x, y, target_x, target_y);
    dist = point_distance(x, y, target_x, target_y);
    
    rel_dir = dir + phy_rotation;
    // If it is sufficiently far away, swim as fast as possible.
    // If it is close to the target, ease up so as not to overshoot.
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
        child.m = base_phenotype();
        child.m.max_swim_strength = m.max_swim_strength + rand_norm(0, m.max_swim_strength/3);
        child.m.max_steering_strength = m.max_steering_strength + rand_norm(0, m.max_steering_strength/3);
        child.m.eagerness  = m.eagerness + rand_norm(0, m.eagerness/3);
        child.m.color_pref = m.color_pref + rand_norm(0, m.color_pref/3);
        child.m.wall_discouragement = m.wall_discouragement + rand_norm(0, m.wall_discouragement/3);
        
        child.m.eye_white_scale = m.eye_white_scale + rand_norm(0, m.eye_white_scale/10);
        child.m.pupil_scale = m.pupil_scale + rand_norm(0, m.pupil_scale/10);
        
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

