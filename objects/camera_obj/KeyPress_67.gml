if(active) {
    active = false;
    __view_set( e__VW.WView, 0, room_width );
    __view_set( e__VW.HView, 0, room_height );
}
else {
    active = true;
    __view_set( e__VW.WView, 0, floor(room_width * scale) );
    __view_set( e__VW.HView, 0, floor(room_height * scale) );
    if (target == -1) {
        target = random_instance(chaser_obj);
        if (target != -1 && instance_exists(target)) {
            (target).chosen = true;
        }
    }
}

