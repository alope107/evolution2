if (initialized) {
    area_ratio = 1000
    tail_scale = area/area_ratio
    tail_offset = abs(tail_loc[0]) + (sprite_get_width(tail_spr) * tail_scale)/2;
    rad = degtorad(phy_rotation);
    tail_x =  x + (-1 * cos(rad) * tail_offset);
    tail_y = y + (-1 * sin(rad) * tail_offset);
    draw_sprite_ext(tail_spr, tail_frame, tail_x, tail_y, tail_scale, tail_scale, -1 * phy_rotation, c_white, image_alpha);
    
    
    // Rotate body
    for (var i = 0; i < 3; i++) {
        rotated_pt = rotate_point(body_coord[i, 0], body_coord[i, 1], phy_rotation);
        rotated_body[i, 0] = rotated_pt[0];
        rotated_body[i, 1] = rotated_pt[1];
    }
    
    draw_set_alpha(image_alpha);
    draw_set_colour(image_blend);

    // Draw body
    draw_triangle(x + rotated_body[0, 0], y + rotated_body[0, 1],
                x + rotated_body[1, 0], y + rotated_body[1, 1],
                x + rotated_body[2, 0], y + rotated_body[2, 1], false);
    
    draw_set_colour(c_black);
    
    // Draw outline
    draw_triangle(x + rotated_body[0, 0], y + rotated_body[0, 1],
                    x + rotated_body[1, 0], y + rotated_body[1, 1],
                    x + rotated_body[2, 0], y + rotated_body[2, 1], true);
                    
    if (chosen) {
        draw_set_colour(c_red);
        draw_line_width(x + rotated_body[0, 0], y + rotated_body[0, 1], 
                        x + rotated_body[1, 0], y + rotated_body[1, 1], 3);
        draw_line_width(x + rotated_body[0, 0], y + rotated_body[0, 1], 
                        x + rotated_body[2, 0], y + rotated_body[2, 1], 3);
        draw_line_width(x + rotated_body[2, 0], y + rotated_body[2, 1], 
                        x + rotated_body[1, 0], y + rotated_body[1, 1], 3);
    }
                  
   
    // Draw eye.
    pupil_offset[0] = white_radius - pupil_radius;
    pupil_offset[1] = 0;
    white_offset = triangle_incenter(rotated_body, side_lengths);
    pupil_dir = point_direction(x + white_offset[0], y + white_offset[1], target_x, target_y)
    pupil_offset = rotate_point(pupil_offset[0], pupil_offset[1], -pupil_dir);
    
    
    draw_set_color(c_white);
    draw_circle(x + white_offset[0], y + white_offset[1], white_radius, false);
    
    draw_set_colour(c_black);
    draw_circle(x + white_offset[0] + pupil_offset[0], y + white_offset[1] + pupil_offset[1], pupil_radius, false);
                 
    draw_set_alpha(1);
    
    draw_set_color(c_white);
    if (global.draw_desire) {
        draw_line(x, y, target_x, target_y);
    }
    if (global.draw_generation) {
        draw_text(x, y - 20, string_hash_to_newline(string(gen)));
    }
    if (global.draw_area) {
        draw_text(x, y + 20, string_hash_to_newline(string(area)));
    }
}