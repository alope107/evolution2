/** 
 * @function
 * @param {type} name
*/
function can_cannibalize(cannibal, target){
	return cannibal.area > global.cannibal_factor * target.area; 
}