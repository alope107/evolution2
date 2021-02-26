/** 
 * @function
 * @param {type} name
*/
function Set(_initial) constructor{
	show_debug_message("ruhroh");
	_map = {}
	for (var i =0; i < array_length(_initial); i++) {
		variable_struct_set(_map, string(_initial[i]), _initial[i]);
	}
	show_debug_message("cutblow");
	add = function(_val) {
		variable_struct_set(_map, string(val), val);
	}
	
	contains = function(_val) {
		return variable_struct_exists(_map, string(val));
	};
	
	remove = function(_val) {
		variable_struct_remove(_map, string(val));
	}
	
	to_array = function() {	
		var new_arr = [];
		var names = variable_struct_get_names(_map);
		
		for (var i = 0; i < array_length(names); i++) {
			append(new_arr, variable_struct_get(_map, names[i]));
		}
		return new_arr;
	}
	
	//toString = function() {
	//	return string(to_array());
	//}
}