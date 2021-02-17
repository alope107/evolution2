eat_speed = .1;

fix = get_food_fixture(image_xscale*sprite_width/2);
bound_fix = physics_fixture_bind(fix, self);
physics_fixture_delete(fix);

r = random(255);
g = random(255);
b = random(255);

image_blend = make_colour_rgb(r, g, b);

to_destroy = false;


