var inputs = function() {
	var chain_dist = obj_game.chain_dist
	if obj_input.input_select and obj_input.input_r {
		var tchannel = (cursor_x - 105) / 100
		var tchain = (cursor_y - 100) / chain_dist
		var bozo = true
		if array_length(global.json.channels) <= tchannel {
			bozo = false
		} else if array_length(global.json.channels[tchannel].chains) <= tchain {
			bozo = false
		}
		if bozo {
			var tc = global.json.channels[tchannel].chains[tchain]
			if tc >= 0 {
				obj_game.page = 1
				while tc >= array_length(global.json.chains) {
					array_push(global.json.chains, array_create(16, -1))
				}
				obj_gui_chain.target_chain = tc
			}
		}
		global.dpad_timers[1] = 15
		return false
	}
	
	var can_cursor_move = true
	
	// change chain index
	var tchannel = (cursor_x - 105) / 100
	var tchain = (cursor_y - 100) / chain_dist
	if obj_input.input_ah and obj_input.input_l and global.dpad_timers[0] < 0 {
		global.dpad_timers[0] = 5
		global.json.channels[tchannel].chains[tchain] = clamp(global.json.channels[tchannel].chains[tchain] - 1, 0, 999999)
		copied_chain = clamp(global.json.channels[tchannel].chains[tchain], 0, array_length(global.json.chains))
		can_cursor_move = false
	} else if obj_input.input_ah and obj_input.input_r and global.dpad_timers[1] < 0 {
		global.dpad_timers[1] = 5
		global.json.channels[tchannel].chains[tchain] = clamp(global.json.channels[tchannel].chains[tchain] + 1, 0, 999999)
		copied_chain = clamp(global.json.channels[tchannel].chains[tchain], 0, 999999)
		can_cursor_move = false
	} else if obj_input.input_ah and obj_input.input_u and global.dpad_timers[2] < 0 {
		global.dpad_timers[2] = 5
		global.json.channels[tchannel].chains[tchain] = global.json.channels[tchannel].chains[tchain] + 10
		copied_chain = clamp(global.json.channels[tchannel].chains[tchain], 0, 999999)
		can_cursor_move = false
	} else if obj_input.input_ah and obj_input.input_d and global.dpad_timers[3] < 0 {
		global.dpad_timers[3] = 5
		global.json.channels[tchannel].chains[tchain] = clamp(global.json.channels[tchannel].chains[tchain] - 10, 0, 999999)
		copied_chain = clamp(global.json.channels[tchannel].chains[tchain], 0, 999999)
		can_cursor_move = false
	}
	
	// add chains
	if (obj_input.input_ah and obj_input.input_b) or (obj_input.input_a and obj_input.input_bh) {
		global.json.channels[tchannel].chains[tchain] = -1
		can_cursor_move = false
	} else if obj_input.input_a {
		if global.json.channels[tchannel].chains[tchain] == -1 {
			global.json.channels[tchannel].chains[tchain] = copied_chain
		} else {
			copied_chain = clamp(global.json.channels[tchannel].chains[tchain], 0, array_length(global.json.chains))
		}
		can_cursor_move = false
	}
	
	// move cursor
	if can_cursor_move {
		if obj_input.input_l and global.dpad_timers[0] < 0 and cursor_x > 200 {
			cursor_x -= 100
			global.dpad_timers[0] = 5
		}
		if obj_input.input_r and global.dpad_timers[1] < 0 and cursor_x < array_length(global.json.channels) * 100 {
			cursor_x += 100
			global.dpad_timers[1] = 5
		}
		if obj_input.input_d and global.dpad_timers[3] < 0 and cursor_y < chain_dist * 999 {
			cursor_y += chain_dist
			global.dpad_timers[3] = 5
		}
		if obj_input.input_u and global.dpad_timers[2] < 0 and cursor_y > 105 {
			cursor_y -= chain_dist
			global.dpad_timers[2] = 5
		}
	}
}
visible = obj_game.page == 0

if visible {
	inputs()
}