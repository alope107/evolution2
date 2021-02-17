timer -= 1;
if (timer < 0) {
    instance_create(random_range(100, room_width-100), random_range(100, room_height-100), food_obj);
    timer = interval;
}

