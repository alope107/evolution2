timer -= 1;

if (timer <= 0) {
    food = instance_create(x, y, food_obj);
    
    color_variation = 100;
    food.r = r + max(min(rand_norm(0, color_variation), 255), 0);
    food.g = g + max(min(rand_norm(0, color_variation), 255), 0);
    food.b = b + max(min(rand_norm(0, color_variation), 255), 0);
    food.image_blend = make_colour_rgb(food.r, food.g, food.b);
    
    with (food) {
        physics_apply_local_force(0, 0, random(100), random(100));
    }
    
    timer = base_interval+ rand_norm(0, interval_deviation);
}

