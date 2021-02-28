/** 
 * @function create_chaser_fix
 * @param {array} poly_coord 2D array of coordinates of vertices
 * (must be ordered clockwise and be non-concave)
*/
function create_chaser_fix(poly_coord){
	var fix = create_polygon_fix(poly_coord);
	var params = chaser_fix_params();
    
	physics_fixture_set_density(fix, params.density);
	physics_fixture_set_restitution(fix, params.restitution);
	physics_fixture_set_linear_damping(fix, params.linear_damping);
	physics_fixture_set_angular_damping(fix, params.angular_damping);
	physics_fixture_set_friction(fix, params.frict);
	
	physics_fixture_set_collision_group(fix, 0);
	
	return fix;
}

function chaser_fix_params() {
	return {
		density: .3,
		restitution: 1,
		linear_damping: 1.2,
		angular_damping: .5,
		frict: .01,
		// TODO: Move elsewhere?
		collision_group: 0,
	}
}