function color_similarity(obj0, obj1) {
	// returns a value [0, 1] representing how similar the colors are of two objects
	// each object must have hsv values
	
	// TODO: Re-enable cache?
	//_key = hash(obj0, obj1);
	//if(global.similarity_cache.has(_key)) {
	//	return global.similarity_cache.get(_key);
	//}

	var r_comp = power(abs(obj0.r - obj1.r), 2);
	var g_comp = power(abs(obj0.g - obj1.g), 2);
	var b_comp = power(abs(obj0.b - obj1.b), 2);
	var color_dist = power(r_comp + g_comp + b_comp , .333);
	var color_sim = (global.unit_length - color_dist) / global.unit_length;

	// TODO: Re-enable cache?
	//global.similarity_cache.put(_key, color_sim);
	
	
	return color_sim;
}

function hash(obj0, obj1) {
	return string(min(obj0.id, obj1.id)) + "," + string(max(obj0.id, obj1.id));
}
