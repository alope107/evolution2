flag = phy_debug_render_aabb | phy_debug_render_collision_pairs | phy_debug_render_obb;
flag = phy_debug_render_shapes;
if (global.draw_physics) {
    physics_world_draw_debug(flag);
}
if (global.draw_interval) {
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(room_width/2, room_height/2, string_hash_to_newline(string(interval)));
}

