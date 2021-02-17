show_debug_overlay(true);

dx[0] = 1; dy[0] = 0;
dx[1] = -1; dy[1] = 0;
dx[2] = 0; dy[2] = 1;
dx[3] = 0; dy[3] = -1;
possible_neighbors = array_length_1d(dx);

iters = 5;

update_thresh = 1;//10;
update=0;

x_steps = 50;
y_steps = 50;

x_step_size = room_width / x_steps;
y_step_size = room_height / y_steps;

inertia = .3;

for(i = 0; i < x_steps; i++) {
    for(j = 0; j < x_steps; j++) {
        r[i ,j] = i;
        g[i ,j] = j;
        b[i ,j] = i+j;
        r_new[i ,j] = i;
        g_new[i ,j] = j;
        b_new[i ,j] = i+j;
    } 
}
r[10, 10] = 255;
g[10, 10] = 255;
b[10, 10] = 255;


x_smash = floor(random(x_steps));
y_smash = floor(random(y_steps));
r_smash = random(255);
g_smash = random(255);
b_smash = random(255);

smash_update = 0;
smash_update_thresh = 60;

should_smash = 0;

strength = .001;
reduce = false;
increase = false;

