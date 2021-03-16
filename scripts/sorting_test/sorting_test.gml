function arr_cmp_test(){
	one_d_equal();
	one_d_less();
	one_d_greater();
	
	multi_d_equal();
	multi_d_less();
	multi_d_greater();
}

function one_d_equal() {
	var a1 = [1, 2, 3];
	var a2 = [1, 2, 3];
	print("---------------");
	print(global.arr_cmp(a1, a2));
	print("~~~~~~~~~~~~~~~");
	assert_equal(0, global.arr_cmp(a1, a2), "Equal 1d arrays should compare to 0");
}

function one_d_less() {
	var a1 = [1, 1, 3];
	var a2 = [1, 2, 3];
	
	assert_equal(-1, global.arr_cmp(a1, a2), "Lesser 1d array should compare to -1");
}

function one_d_greater() {
	var a1 = [1, 2, 3];
	var a2 = [1, 1, 3];
	
	assert_equal(1, global.arr_cmp(a1, a2), "Greater 1d array should compare to 1");
}

function multi_d_equal() {
	var a1 = [1, [2, [6, 3], 7], [3, 9]];
	var a2 = [1, [2, [6, 3], 7], [3, 9]];
	
	assert_equal(0, global.arr_cmp(a1, a2), "Equal 2d arrays should compare to 0");
}

function multi_d_less() {
	var a1 = [1, [2, [6, 1], 7], [3, 9]];
	var a2 = [1, [2, [6, 3], 7], [3, 9]];
	
	assert_equal(-1, global.arr_cmp(a1, a2), "Lesser 1d arrays should compare to -1");
}

function multi_d_greater() {
	var a1 = [1, [2, [6, 3], 9], [3, 9]];
	var a2 = [1, [2, [6, 3], 7], [3, 9]];
	
	assert_equal(1, global.arr_cmp(a1, a2), "Greater 1d arrays should compare to 1");
}