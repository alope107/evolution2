/** 
 * @function
 * @param {type} name
*/
function Node(_val) constructor {
	val = _val;
	prev = -1;
	next = -1;
}

function Deque() constructor {
	head = -1;
	tail = -1;
	length = 0;
	
	append = function(_val) {
		var _new_node
		_new_node = new Node(_val);
		length += 1;
		if (head == -1) {
			head = _new_node;
			tail = _new_node;
		}
		else {
			tail.next = _new_node;
			_new_node.prev = tail;
			tail = _new_node;
		}
		return _new_node;
	}
	
	prepend = function(_val) {
		var _new_node
		_new_node = new Node(_val);
		length += 1;
		if (head == -1) {
			head = _new_node;
			tail = _new_node;
		}
		else {
			head.prev = _new_node;
			_new_node.next = head;
			head = _new_node;
		}
		return _new_node;
	}
	
	remove = function(_node) {
		if(_node == tail) {
			tail = _node.prev;
		}
		if(_node == head) {
			head = _node.next;
		}
		if(_node.prev != 1) {
			_node.prev.next = _node.next;
		}
		if(_node.next != -1) {
			_node.next.prev = _node.prev
		}
		_node.next = -1;
		_node.prev = -1;
		length -= 1;
		return _node.val;
	}
	
	pop_right = function() {
		if (tail == -1) {
			return -1;
		}
		return remove(tail);
	}
	
	pop_left = function() {
		if (head == -1) {
			return -1;
		}
		return remove(head);
	}
	
	move_to_front = function(_node) {
		prepend(remove(_node));
	}
	
	move_to_back = function(_node) {
		append(remove(_node));
	}
}