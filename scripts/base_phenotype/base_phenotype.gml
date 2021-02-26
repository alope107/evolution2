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
		// Floor of this number is the number of vertices the critter will have
		// Cannot have fewer than 3 vertices regardless of value
		vertices: 3.5,
	};
}

// How much to vary values by for initial populations
// Higher values indicate higher variation
function base_perturb_scale() {
	return {
		max_swim_strength: .5,
		max_steering_strength: .5,
		eagerness: .5,
		// No variation
		starting_energy: 0.0,
		color_pref: .5,
		wall_discouragement: .5,
		eye_white_scale: .333,
		pupil_scale: .333,
		vertices: .5, 
	}
}

function base_bounds() {
	return {
		max_swim_strength: {minimum: -10000000, maximum: 10000000},
		max_steering_strength: {minimum: -10000000, maximum: 10000000},
		eagerness: {minimum: -10000000, maximum: 10000000},
		starting_energy: {minimum: -10000000, maximum: 10000000},
		color_pref: {minimum: -10000000, maximum: 10000000},
		wall_discouragement: {minimum: -10000000, maximum: 10000000},
		eye_white_scale: {minimum: -10000000, maximum: 10000000},
		pupil_scale: {minimum: -10000000, maximum: 10000000},
		vertices: {minimum: -10000000, maximum: 10000000}, 
	}
}
