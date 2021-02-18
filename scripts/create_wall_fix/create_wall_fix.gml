function create_wall_fix(width, height){

	density = 0;
	restitution = .6;
	linear_damping = .1;
	angular_damping = .1;
	fric = .005;
	collision_group = 0

	fix = physics_fixture_create();
	physics_fixture_set_density(fix, density);
	physics_fixture_set_restitution(fix, restitution);
	physics_fixture_set_linear_damping(fix, linear_damping);
	physics_fixture_set_angular_damping(fix, angular_damping);
	physics_fixture_set_collision_group(fix, collision_group);
	physics_fixture_set_box_shape(fix, width/2, height/2);

	return fix;
}