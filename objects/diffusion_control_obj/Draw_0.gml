for(i = 0; i < x_steps; i++) {
    for(j = 0; j < y_steps; j++) {
        color = make_colour_rgb(r[i, j], g[i, j], b[i, j]);
        //color = make_colour_hsv(r[i, j], g[i, j], b[i, j]);
        x_start = i * x_step_size;
        y_start = j * y_step_size;
        //draw_rectangle_fast(x_start, y_start, x_start + x_step_size, y_start + y_step_size, color);
        draw_rectangle_colour(x_start, y_start, x_start + x_step_size, y_start + y_step_size, color, color, color, color, false);
    }
}

draw_text(room_width - 100, 30, string_hash_to_newline(string(inertia)));
draw_text(room_width - 100, room_height -30, string_hash_to_newline(string(iters)));
draw_text(100, room_height -30, string_hash_to_newline(string(r[25,25])));


