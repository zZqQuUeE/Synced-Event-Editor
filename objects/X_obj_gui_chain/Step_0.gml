var input = function() {
	var chain_dist = X_obj_game.chain_dist
	var can_cursor_move = true
	
	if X_obj_input.input_select and X_obj_input.input_r and global.dpad_timers[1] < 0 {
		var tphrase = (cursor_y - 105) / chain_dist
		if array_length(global.json.chains[target_chain]) > tphrase {
			var tp = global.json.chains[target_chain][tphrase]
			X_obj_game.page = 2
			while tp >= array_length(global.json.phrases) {
				array_push(global.json.phrases, array_create(16, -1))
			}
			X_obj_gui_phrase.target_phrase = tp  //global.json.channels[tchannel].chains[tchain]
		}
		global.dpad_timers[1] = 15
		return false
	}
	if X_obj_input.input_select and X_obj_input.input_l and global.dpad_timers[0] < 0 {
		X_obj_game.page = 0
		global.dpad_timers[0] = 15
		return false
	}
	
	// change phrase index
	if X_obj_input.input_ah and X_obj_input.input_l and global.dpad_timers[0] < 0 {
		global.dpad_timers[0] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] - 1, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	} else if X_obj_input.input_ah and X_obj_input.input_r and global.dpad_timers[1] < 0 {
		global.dpad_timers[1] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] + 1, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	} else if X_obj_input.input_ah and X_obj_input.input_u and global.dpad_timers[2] < 0 {
		global.dpad_timers[2] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] + 10, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	} else if X_obj_input.input_ah and X_obj_input.input_d and global.dpad_timers[3] < 0 {
		global.dpad_timers[3] = 5
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = clamp(global.json.chains[target_chain][tphrase] - 10, 0, 999999)
		copied_chain = global.json.chains[target_chain][tphrase]
		can_cursor_move = false
	}
	
	// move cursor
	if can_cursor_move {
		if X_obj_input.input_u and global.dpad_timers[2] < 0 and cursor_y > 105 {
			cursor_y -= chain_dist
			global.dpad_timers[2] = 5
		}
		if X_obj_input.input_d and global.dpad_timers[3] < 0 and cursor_y < 18 * chain_dist { //array_length(global.json.chains[target_chain])
			cursor_y += chain_dist
			global.dpad_timers[3] = 5
		}
	}
	
	// add phrases
	if (X_obj_input.input_ah and X_obj_input.input_b) or (X_obj_input.input_a and X_obj_input.input_bh) {
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = -1
	} else if X_obj_input.input_a {
		var tphrase = (cursor_y - 105) / chain_dist
		global.json.chains[target_chain][tphrase] = copied_chain
	}
}
visible = X_obj_game.page == 1

if visible {
	input()
}