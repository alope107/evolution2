function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // bouncer_obj
	global.__objectDepths[1] = 0; // wall_obj
	global.__objectDepths[2] = 0; // control_obj
	global.__objectDepths[3] = 0; // static_parent_obj
	global.__objectDepths[4] = 0; // dynamic_parent_obj
	global.__objectDepths[5] = 0; // chaser_obj
	global.__objectDepths[6] = 0; // food_obj
	global.__objectDepths[7] = 0; // feeder_obj
	global.__objectDepths[8] = 0; // diffusion_control_obj
	global.__objectDepths[9] = 0; // debugger_obj
	global.__objectDepths[10] = 0; // camera_obj


	global.__objectNames[0] = "bouncer_obj";
	global.__objectNames[1] = "wall_obj";
	global.__objectNames[2] = "control_obj";
	global.__objectNames[3] = "static_parent_obj";
	global.__objectNames[4] = "dynamic_parent_obj";
	global.__objectNames[5] = "chaser_obj";
	global.__objectNames[6] = "food_obj";
	global.__objectNames[7] = "feeder_obj";
	global.__objectNames[8] = "diffusion_control_obj";
	global.__objectNames[9] = "debugger_obj";
	global.__objectNames[10] = "camera_obj";


	// create another array that has the correct entries
	var length = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<length; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
