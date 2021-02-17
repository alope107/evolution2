for(dev = 0; dev < 10; dev++) {
    if(device_mouse_check_button(dev, mb_left))
    {
        mx = device_mouse_x(dev);
        my = device_mouse_y(dev);
        
        bleach_x = max(0, min(floor(mx / x_step_size), x_steps - 1));
        bleach_y = max(0, min(floor(my / y_step_size), y_steps - 1));
        
        r[bleach_x, bleach_y] = 255;
        g[bleach_x, bleach_y] = 255;
        b[bleach_x, bleach_y] = 255;
    }
}

for(iter = 0; iter < iters; iter++) {
    //if(update >= update_thresh) {
        //update = 0;
        for(i = 0; i < x_steps; i++) {
            for(j = 0; j < y_steps; j++) {
                neighbors = 0;
                neighbor_avg_r = 0;
                neighbor_avg_g = 0;
                neighbor_avg_b = 0;
                for(q = 0; q < possible_neighbors; q++) {
                   neigh_x = i + dx[q];
                   neigh_y = j + dy[q];
                   if(neigh_x < 0 || neigh_x >= x_steps || neigh_y < 0 || neigh_y >= y_steps) {
                        continue;
                   }
                   neighbors++;
                   neighbor_avg_r += r[neigh_x, neigh_y];
                   neighbor_avg_g += g[neigh_x, neigh_y];
                   neighbor_avg_b += b[neigh_x, neigh_y];
                }
                neighbor_avg_r /= neighbors;
                neighbor_avg_g /= neighbors;
                neighbor_avg_b /= neighbors;
                r_new[i, j] = (r[i, j]*inertia) + (neighbor_avg_r * (1-inertia));
                g_new[i, j] = (g[i, j]*inertia) + (neighbor_avg_g * (1-inertia));
                b_new[i, j] = (b[i, j]*inertia) + (neighbor_avg_b * (1-inertia));
                
                if (reduce) {
                    reduce_strength = 1 - strength;
                    r_new[i, j] *= reduce_strength;
                    g_new[i, j] *= reduce_strength;
                    b_new[i, j] *= reduce_strength;
                }
                if (increase) {
                    increase_strength = 1 + strength;
                    r_new[i, j] *= increase_strength;
                    g_new[i, j] *= increase_strength;
                    b_new[i, j] *= increase_strength;
                }
            }
        }
        
        r = r_new;
        g = g_new;
        b = b_new;
        
        
    //}
}

if(smash_update >= smash_update_thresh) {
    smash_update = 0;
    x_smash = floor(random(x_steps));
    y_smash = floor(random(y_steps));
    r_smash = random(255);
    g_smash = random(255);
    b_smash = random(255);
}

if (should_smash == 1) {
    r[x_smash, y_smash] = r_smash;
    g[x_smash, y_smash] = g_smash;
    b[x_smash, y_smash] = b_smash;
}

smash_update++;
update++;


/*for(i = 0; i < x_steps; i++) {
    for(j = 0; j < y_steps; j++) {
        r[i, j] = r_new[i, j];
        g[i, j] = g_new[i, j];
        b[i, j] = b_new[i, j];
    }
}*/

/* */
/*  */
