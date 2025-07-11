var chain_dist = X_obj_game.chain_dist
visible = X_obj_game.page == 2

if visible {
	if X_obj_input.input_select and X_obj_input.input_r and global.dpad_timers[1] < 0 {
		var tinstr = array_get(global.json.phrases[target_phrase], (cursor_y - 105) / chain_dist)
		X_obj_gui_instrument.target_instr = max(tinstr, 1)
		X_obj_game.page = 3
		global.dpad_timers[1] = 15
	}
	if X_obj_input.input_select and X_obj_input.input_l and global.dpad_timers[0] < 0 {
		X_obj_game.page = 1
		global.dpad_timers[0] = 15
	}
	
	if X_obj_input.input_u and global.dpad_timers[2] < 0 and cursor_y > 105 {
		cursor_y -= chain_dist
		global.dpad_timers[2] = 5
	}
	if X_obj_input.input_d and global.dpad_timers[3] < 0 and cursor_y < 18 * chain_dist { //array_length(global.json.chains[target_chain])
		cursor_y += chain_dist
		global.dpad_timers[3] = 5
	}
}