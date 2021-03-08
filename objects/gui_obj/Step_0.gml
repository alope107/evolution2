boxes = [];
var primary_press = device_mouse_check_button(0, mb_left);
var secondary_press = device_mouse_check_button(1, mb_left); // TODO: Check all other devices?
// current position of primary device
var current_pos = [device_mouse_raw_x(0), device_mouse_raw_y(0)];
// If we've got two touches, it's multitouch
if(primary_press && secondary_press) {
	mode = current_multi;
}
// If we've got one touch on the primary device
else if (primary_press &&
		 !secondary_press) 
{
	// If we've got one touch and it used to be multitouch, it's past multi
	if(last_mode == current_multi ||
	   last_mode == past_multi){
		mode = past_multi;
	}
	// Starting a single press, record location
	else if (last_mode == unpressed){
		start_pos = current_pos;
		mode = single;
	}
	// Continuing a single press
	else if (last_mode == single) {
		mode = single;
	}
} 
// If neither are preseed
else if (!primary_press && !secondary_press) {
	// Completing a single press, mark location.
	if (last_mode == single) {
		end_pos = current_pos;
	}
	mode = unpressed;
}
// If only the secondary is pressed then it must have been a multi at some point
else if(!primary_press && secondary_press) {
	mode = past_multi;
}



var width = window_get_width();
var col_size = width / (len(buttons) + 1);
var x_pos = 0;

var button_selected = false;

for(var i = 0; i < len(buttons); i++) {
	x_pos += col_size;
		var spr = buttons[i].spr;
		var box_length = max(sprite_get_width(spr), sprite_get_height(spr)) * box_ratio;
		append(boxes, [[x_pos - (box_length/2), v_pad - (box_length/2)],
					   [x_pos + (box_length/2), v_pad + (box_length/2)]]);
}
if (end_pos != -1 && start_pos != -1) {
	for(var i = 0; i < len(boxes); i++) {
		var box = boxes[i];
		// If our click started & ended on an icon without multitouching
		if(point_in_rectangle(start_pos[0], start_pos[1],
							  box[0][0], box[0][1], box[1][0], box[1][1]) &&
		   point_in_rectangle(end_pos[0], end_pos[1],
							  box[0][0], box[0][1], box[1][0], box[1][1])) {
			button_selected = true;
			selected = buttons[i];
		}
	}
}

// if we've completed a single click not on a button
if(end_pos != -1 && start_pos != -1 && !button_selected) 
{
	instance_create_layer(mouse_x, mouse_y, layer, selected.obj);
}

end_pos = -1;
last_mode = mode;