dir = point_direction(x, y, mouse_x, mouse_y);

dx = cos(degtorad(dir)) * force_strength;
dy = -1 * sin(degtorad(dir)) * force_strength;

physics_apply_force(x, y, dx, dy);

