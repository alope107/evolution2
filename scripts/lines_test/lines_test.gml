function line_segments_test() {
	unique_lines_test();
	unrepeated_lines_test();
}

function unique_lines_test(){
	var lines = [
		[[1, 0],[5, 4]],
		[[1, 0],[5, 4]],
		[[5, 4],[1, 0]],
		[[0, 1], [5, 4]],
		[[1, 1], [1, 1]],
		[[1, 1], [1, 1]],
		[[-8, 44],[52, 41]],
	];
	
	var expected = [
		[[-8, 44],[52, 41]],
		[[0, 1], [5, 4]],
		[[1, 0],[5, 4]],
		[[1, 1], [1, 1]],
	];
	
	var actual = unique_lines(lines);
	assert_equal_unordered(expected, actual, "Lines not properly de-duped");
}

function unrepeated_lines_test() {
	var lines = [
		// Reversed but repeated
		[[1, 0],[5, 4]],
		[[5, 4],[1, 0]],
		
		// Unique
		[[0, 1], [5, 4]],
		
		// Unique
		[[-1, -1], [-1, -1]],
		
		// Repeated many times
		[[1, 1], [1, 1]],
		[[1, 1], [1, 1]],
		[[1, 1], [1, 1]],
		[[1, 1], [1, 1]],
		
		// Repeated reversed and unreversed
		[[-8, 44],[52, 41]],
		[[-8, 44],[52, 41]],
		[[52, 41], [-8, 44]],
		
		
	];
	
	var expected = [
		[[0, 1], [5, 4]],
		[[-1, -1], [-1, -1]],
	];
	
	var actual = unrepeated_lines(lines);
	assert_equal_unordered(expected, actual, "Unique lines not properly identified");
}