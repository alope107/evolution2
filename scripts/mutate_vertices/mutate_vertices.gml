function mutate_vertices(vertices, std_dev_mod, min_angle){
	// first, mutate core triangle
	var base_triangle = slice(vertices, 0, 3);
	var new_vertices = mutate_triangle(base_triangle, std_dev_mod, min_angle);
	
	// Mutate each other vertex independently
	// TODO: enforce constraints
	
	for(var i = 3; i < len(vertices); i++) {
		var new_point = [];
		for (var j = 0; j < 2; j++) {
	        new_point[j] = rand_norm(vertices[i][j], 
	                                 vertices[i][j] / std_dev_mod);
	    }
		append(new_vertices, new_point);
	}
	
	return new_vertices;
}