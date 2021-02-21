/** 
 * @function relative_to_absolute
 * @return array of point scaled from screen position to room position
*/
function relative_to_absolute(point, camera_index, port_index){
	var _camera_pos, _view_scale
	_camera_pos = get_camera_pos(camera_index);
	_view_scale = get_view_scale(camera_index, port_index)
	return [
		((point[0] - view_xport[port_index]) / _view_scale[0]) + _camera_pos[0],
		((point[1] - view_xport[port_index]) / _view_scale[1]) + _camera_pos[1],
	]
}

/** 
 * @function relative_to_absolute
 * @return array of point scaled from room position to screen position
*/
function absolute_to_relative(point, camera_index, port_index) {
	var _camera_pos, _view_scale
	_camera_pos = get_camera_pos(camera_index);
	_view_scale = get_view_scale(camera_index, port_index)
	return [
		((point[0] - _camera_pos[0]) * _view_scale[0]) + view_xport[port_index],
		((point[1] - _camera_pos[1]) * _view_scale[1]) + view_yport[port_index],
	]
}

function get_camera_pos(camera_index) {
	return [camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])];
}

/** 
 * @function view_scale Returns ratios of port dimensions over camera dimensions
 * @ return array of width_scale, height_scale
*/
function get_view_scale(camera_index, port_index) {
	return [
		view_wport[port_index] / camera_get_view_width(view_camera[camera_index]),
		view_hport[port_index] / camera_get_view_height(view_camera[camera_index]),
	]
}