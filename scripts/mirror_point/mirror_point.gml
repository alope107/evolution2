function mirror_point(stationary, to_flip) {
	//Mirrors a point across another.
	var dx = stationary[0] - to_flip[0];
	var dy = stationary[1] - to_flip[1];

	return [stationary[0] + dx, stationary[1] + dy];
}
