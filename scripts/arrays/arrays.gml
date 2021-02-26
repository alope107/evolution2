/** 
 * @function Flatens array by one level
 * @param {array} arr
*/
function flatten(arr){
	show_debug_message(string(arr));
	show_debug_message("ahom");
	var new_arr = [];
	for (var i = 0; i < array_length(arr); i++) {
		for(var j = 0; j < array_length(arr[i]); j++) {
			append(new_arr, arr[i][j]);
		}
	}
	show_debug_message(string(new_arr));
	return new_arr;
}

function append(arr, val) {
	show_debug_message("ahem");
	arr[@ array_length(arr)] = val;
}

function unique(arr) {
	var set = new Set(arr);
	return set.to_array();
}

