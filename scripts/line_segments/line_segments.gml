/** 
 * Returns unique lines from an array of lines (2d start / end pairs)
 * lines a->b are considered equivalent to b -> a
 * Each returned line will have its coordinates ordered
 * Lines are returned in arbitrary order.
*/
function unique_lines(lines){
	var line_set = new Set([]);
	for(var i = 0; i < len(lines); i++) {
		var line = deep_array_copy(lines[i]);
		array_sort(line, global.arr_cmp);
		line_set.add(line);
	}
	return line_set.to_array();
}



/**
 * Returns only the 2D line segments in an array that don't show up more than once.
 * Lines are returned in arbitrary order.
*/
function unrepeated_lines(lines){
	var all_lines = new Set([]);
	var repeated_lines = new Set([]);
	for(var i = 0; i < len(lines); i++) {
		var line = deep_array_copy(lines[i]);
		array_sort(line, global.arr_cmp);
		if(all_lines.contains(line)) {
			repeated_lines.add(line);
		}
		all_lines.add(line);
	}
	
	var all_lines_arr = all_lines.to_array();
	var unrepeated_lines_arr = [];
	for (var i = 0; i < len(all_lines_arr); i++) {
		var line = all_lines_arr[i];
		if(!repeated_lines.contains(line)) {
			append(unrepeated_lines_arr, line);
		}
	}
	return unrepeated_lines_arr;
}