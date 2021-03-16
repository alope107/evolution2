
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