/*
 * DO NOT CALL DIRECTLY
 * Due to a gamemaker bug, calling this directly for sorting will not work.
 * Instead, use global.arr_cmp
 * FML
 *
 * Compares two arrays for sorting. Arrays must be of same dimension.
 * Performs deep comparison.
 * Returns 1 if arr1 > arr2
 * Returns 0 if arr1 == arr2
 * Returns -1 if arr1 < arr2
*/
function _arr_cmp_internal(arr1, arr2) {
	//print(arr1);
	//print(arr2);
	if(is_array(arr1) ^^ is_array(arr2)) {
		throw "attempting to compare array to non-array: " + string(arr1) + ", " + string(arr2);
	}
	if (!is_array(arr1) && !is_array(arr2)) {
		return cmp(arr1, arr2);
	}
	if(len(arr1) != len(arr2)) {
		throw "attempting to compare arrays of unequal length: " + string(arr1) + ", " + string(arr2);
	}
	for(var i = 0; i < len(arr1); i++) {
		var cmp_val = _arr_cmp_internal(arr1[i], arr2[i]);
		if(cmp_val != 0) {
			return cmp_val;
		}
	}
	return 0;
}

// Idiotic export to avoid gamemaker bug
// Use this one
global.arr_cmp = function(a, b) {return _arr_cmp_internal(a, b);};

/*
 * Compares two scalar elements for sorting.
 * Returns 1 if arr1 > arr2
 * Returns 0 if arr1 == arr2
 * Returns -1 if arr1 < arr2
*/
function cmp(a, b) {
	if (a > b) {
		return 1;
	}
	if (a < b) {
		return -1;
	}
	return 0;
}