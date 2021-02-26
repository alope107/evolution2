function select_target() {
	// Return the coordinates of where the creature is interested in going.
	// TODO: Fix for cannibals

	var targets, best_target, afraid, found_target, max_desirability;

	targets[0] = food_obj;
	if (global.cannibals) {
	    targets[1] = chaser_obj;
	}

	best_target = -1;
	afraid = false;
	found_target = false;
	
	// Set desirability SO LOW that no one could ever want it.
    max_desirability = -9999999;

	// For each type of item that can be eaten
	for (i = 0; i < array_length_1d(targets); i++) {
	    // Inspect every instance of that type
	    for (j = 0; j < instance_number(targets[i]); j++) {
	        var cur_target = instance_find(targets[i], j);
        
	        if (targets[i] == chaser_obj) {
	            // If we're going to be concerned with a creature, it should be 
	            // initialized and either small enough to eat or big enough to eat us.
	            if (!cur_target.initialized ||
	                !(cur_target.area < area/2 || cur_target.area > area * 2))
	                {
	                    continue;
	                }
	        }
        
	        var dist = point_distance(x, y, cur_target.x, cur_target.y);
	        var color_des = m.color_pref * color_similarity(self, cur_target);
	        var desirability = (-1 * dist) + color_des;
        
	        if (collision_line(x, y, cur_target.x, cur_target.y, wall_obj, false, true)) {
	            desirability -= m.wall_discouragement;
	        }
	        if (desirability > max_desirability) {
				found_target = true;
	            max_desirability = desirability;
	            best_target = cur_target;
	            // Whether we're in fear for our life.
	            afraid = (targets[i] == chaser_obj && cur_target.area > area * 2);
	        }
	    }
	}

	return {
		target: best_target,
		afraidOf: afraid,
		found: found_target,
	};
}
