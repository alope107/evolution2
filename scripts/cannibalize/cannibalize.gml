/** 
 * @function
 * @param {type} name
*/
function can_cannibalize(cannibal, target){
	return cannibal.total_area > global.cannibal_factor * target.total_area; 
}