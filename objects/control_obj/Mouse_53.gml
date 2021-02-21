clicked = clicked_chaser();
if (clicked != -1) {
    with (chaser_obj) {
        chosen = false;
    }
    (clicked).chosen = true;
    //(camera_obj).target = clicked;
}
else {
    instance_create(mouse_x, mouse_y, chaser_obj);
}

