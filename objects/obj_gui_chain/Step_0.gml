var input = function() {
	var chain_dist = obj_game.chain_dist
	var can_cursor_move = true
	
	if obj_input.input_select and obj_input.input_r and global.dpad_timers[1] < 0 {
		var tphrase = (cursor_y - 105) / chain_dist
		if array_length(global.json.chains[target_chain]) > tphrase {
			var tp = global.json.chains[target_chain][tphrase]
			obj_game.page = 2
			while tp >= array_length(global.json.phrases) {
				array_push(global.json.phrases, array_create(16, -1))
			}
			obj_gui_phrase.target_phrase = tp  //global.json.channels[tchannel].chains[tchain]
		}
		global.dpad_timers[1] = 15
		return false
	}
	if obj_input.input_select and obj_input.input_l and global.dpad_timers[0] < 0 {
		obj_game.page = 0
		global.dpad_timers[0] = 15
		return false
	}
	
	// change phrase index
	if obj_input.input_ah and obj_input.input_l and global.dpad_timers[0] < 0 {
		global.dpad_timers[0] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] - 1, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	} else if obj_input.input_ah and obj_input.input_r and global.dpad_timers[1] < 0 {
		global.dpad_timers[1] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] + 1, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	} else if obj_input.input_ah and obj_input.input_u and global.dpad_timers[2] < 0 {
		global.dpad_timers[2] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] + 10, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	} else if obj_input.input_ah and obj_input.input_d and global.dpad_timers[3] < 0 {
		global.dpad_timers[3] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] - 10, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	}
	
	// move cursor
	if can_cursor_move {
		if obj_input.input_u and global.dpad_timers[2] < 0 and cursor_y > 105 {
			cursor_y -= chain_dist
			global.dpad_timers[2] = 5
		}
		if obj_input.input_d and global.dpad_timers[3] < 0 and cursor_y < 18 * chain_dist { //array_length(global.json.chains[target_chain])
			cursor_y += chain_dist
			global.dpad_timers[3] = 5
		}
	}
	
	// add phrases
	if (obj_input.input_ah and obj_input.input_b) or (obj_input.input_a and obj_input.input_bh) {
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = -1
	} else if obj_input.input_a {
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = copied_chain
	}
}
visible = obj_game.page == 1

if visible {
	input()
}