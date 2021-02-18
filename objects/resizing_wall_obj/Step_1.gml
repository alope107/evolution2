if (last_room_width != room_width || last_room_height != room_height) {
	if (bound_fix != -1) {
		physics_remove_fixture(self, bound_fix)
	}
	// Depending on orientation, resize to fit the room dimension with a full wall
	if(orientation == top || orientation == bottom) {
		y_scale = 1
		x_scale = room_width / base_width
		xx = room_width / 2
		if (orientation == top) {
			yy = base_height / 2
		}
		if (orientation == bottom) {
			yy = room_height - (base_height / 2)
		}
	}
	if(orientation == left || orientation == right) {
		x_scale = 1
		y_scale = room_height / base_height
		yy = room_height/2
	
		if (orientation == left) {
			xx = base_width / 2
		}
		if (orientation == right) {
			xx = room_width - (base_width / 2)
		}
	}
	image_xscale = x_scale
	image_yscale = y_scale
	
	fix = create_wall_fix(x_scale * base_width, y_scale * base_height)
	bound_fix = physics_fixture_bind(fix, self)
	physics_fixture_delete(fix)
	
	phy_position_x = xx
	phy_position_y = yy
}

last_room_height = room_height
last_room_width = room_width