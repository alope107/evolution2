
function assert_equal(expected, actual, err_msg){
	var comparison;
	try {
		comparison = global.arr_cmp(expected, actual);
	} catch(err) {
		// If there's an error (likely because of different array lengths) they're not equal
		comparison = -1;
	}
	if (comparison != 0) {
		throw "\n" +
		      "expected: " + string(expected) + "\n" +
		      "actual: " + string(actual) + "\n" +
			  err_msg;
	}
}

function assert_equal_unordered(expected, actual, err_msg) {
	var sorted_expected = deep_array_copy(expected);
	array_sort(sorted_expected, global.arr_cmp);
	
	var sorted_actual = deep_array_copy(actual);
	array_sort(sorted_actual, global.arr_cmp);
	
	assert_equal(sorted_expected, sorted_actual, err_msg);
}