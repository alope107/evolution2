scale += .01;
scale = min(scale, 1.0);
__view_set( e__VW.WView, 0, floor(room_width * scale) );
__view_set( e__VW.HView, 0, floor(room_height * scale) );
__view_set( e__VW.HBorder, 0, floor(room_width * scale * borderFrac) );
__view_set( e__VW.VBorder, 0, floor(room_height * scale * borderFrac) );

