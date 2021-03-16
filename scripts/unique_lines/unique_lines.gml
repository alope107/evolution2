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
		print(line);
		array_sort(line, global.arr_cmp);
		print(line);
		print("---------------");
		line_set.add(line);
	}
	return line_set.to_array();
}