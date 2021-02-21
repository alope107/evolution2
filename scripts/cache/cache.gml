/** 
 * @function
 * @param {type} name
*/
function LRUCache(_capacity) constructor {
	
	capacity = _capacity;
	map = ds_map_create();
	destroyed = false;
	queue = new Deque();
	
	put = function(_key, _val) {
		var _new_node
		_crash_if_destroyed();
		if (ds_map_exists(map, _key)) {
			old_entry = map[? _key]
			old_entry.val = _val;
			queue.move_to_front(old_entry.node);
		} else {
			_new_node = queue.prepend(_key);
			map[? _key] = {
				val: _val,
				node: _new_node,
			}
		}
		_delete_if_full();
	}
	
	has = function(_key) {
		return ds_map_exists(map, _key);
	}
	
	get = function(_key) {
		_crash_if_destroyed();
		if (!ds_map_exists(map, _key)) {
			throw "Missing item in LRUCache: " + string(_key);
		}
		entry = map[? _key];
		// TODO: Re-enable?
		//queue.move_to_front(entry.node);
		return entry.val;
	}
	
	destroy = function() {
		_crash_if_destroyed();
		ds_map_destroy(map);
		queue = -1;
	}
	
	_delete_if_full = function() {
		_crash_if_destroyed();
		if (queue.length > capacity) {
			_to_remove = queue.pop_right();
			ds_map_delete(map, _to_remove);
		}
	}
	
	_crash_if_destroyed = function() {
		if(destroyed) {
			throw "Attempting to use destroyed cache.";
		}
	}
}

