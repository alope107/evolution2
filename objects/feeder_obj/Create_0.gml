r = random(255);
g = random(255);
b = random(255);

image_blend = make_colour_rgb(r, g, b);

// Interval between food emits.
base_interval = 400;
interval_deviation = 10;

timer = base_interval + rand_norm(0, interval_deviation);

//physics_apply_local_force(0, 0, random(500), random(500));

