disp_width = 0
disp_height = 0

left = "left"
right = "right"
top = "top"
bottom = "bottom"

last_browser_width = -1
last_browser_height = -1

orientations = [left, right, top, bottom]

for (var i=0; i < array_length(orientations); i++) {
	new_wall = instance_create_layer(0, 0, layer, resizing_wall_obj);
	new_wall.orientation = orientations[i]
}