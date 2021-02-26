//flag = phy_debug_render_shapes;
//physics_world_draw_debug(flag);

for (var j = 0; j < array_length(triangles); j++) {
	draw_set_color(colors[j]);
	draw_set_alpha(.7);
	var rotated_body = [];
	for (var i = 0; i < 3; i++) {
		var rotated_pt;
		rotated_body[i] = rotate_point(triangles[j][i][0], triangles[j][i][1], phy_rotation);
	}

	// Draw body
	draw_triangle(x + rotated_body[0, 0], y + rotated_body[0, 1],
	        x + rotated_body[1, 0], y + rotated_body[1, 1],
	        x + rotated_body[2, 0], y + rotated_body[2, 1], false);
}

draw_set_color(c_red);
draw_set_alpha(1);
draw_circle(phy_com_x, phy_com_y, 3, false);