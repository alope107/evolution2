function base_phenotype() {
	// Creates an object with the default phenotype values.	
	return {
		// Maximum linear force.
		max_swim_strength: 20,
		// Maximum rotational force.
		max_steering_strength: 10,
		// Higher value means it will slow down less as it approaches the target. 
		eagerness: .2,
		// How much energy it begins life with.
		starting_energy: 10000,
		// How much color matters when going after food.
		color_pref: 800,
		// How much the critter is discouraged by there being a wall between it and the food.
		// Larger value means that it's less likely to go for food behind walls.
		wall_discouragement: 50000,
		// How big the white of the eye will be as a ratio of the eye white radius to inradius.
		eye_white_scale: .5,
		// How big the pupil of the eye will be as a ratio of pupil radius the eye white radius.
		pupil_scale: .5,
	};
}
