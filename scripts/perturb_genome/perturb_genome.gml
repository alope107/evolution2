/** 
 * @function perturb_genome
 * @param {genome} genome Struct of genetic values
 * @param {factors} factors Struct of perturb ratios
 * @param {bounds}  bounds Struct of names to stuct with minimum/maximum vals
 * @description Returns a randomly modfied genome.
 * The random values are sample from a normal distribution centered
 * at the old value and with a standard deviation of old_value * perturb_factor.
 * They are bounded by the values in the bounds struct.
*/
function perturb_genome(genome, factors, bounds){
	var names = variable_struct_get_names(genome);
	var new_genome = {};
		
	for (var i = 0; i < array_length(names); i++) {
		var old_val = variable_struct_get(genome, names[i]);
		var perturb_factor = variable_struct_get(factors, names[i]);
		var new_val = rand_norm(old_val, old_val * perturb_factor);
		var bound_vals = variable_struct_get(bounds, names[i]);
		new_val = min(new_val, bound_vals.maximum);
		new_val = max(new_val, bound_vals.minimum);
		variable_struct_set(new_genome, names[i], new_val);
	}
	
	return new_genome;
}