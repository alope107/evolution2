v_pad = 30;
buttons = [ 
	{
		spr: chaser_2_spr,
		obj: chaser_obj,
	},
	{
		spr: bouncer_spr,
		obj: food_obj,
	},
	{
		spr: feeder_spr,
		obj: feeder_obj,
	},
	{
		spr: wall_grey_spr,
		obj: wall_obj,
	},
];
selected = buttons[0];
box_ratio = 1.2;
enabled = true;
unpressed = "unpressed";
single = "single";
current_multi = "current_multi";
past_multi = "past_multi";
mode = unpressed;
last_mode = unpressed;
start_pos = -1;
end_pos = -1;