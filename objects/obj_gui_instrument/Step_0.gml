var chain_dist = obj_game.chain_dist
visible = obj_game.page == 3

if visible {
	if obj_input.input_select and obj_input.input_l and global.dpad_timers[0] < 0 {
		obj_game.page = 2
		global.dpad_timers[0] = 15
	}
	
	//if obj_input.input_u and global.dpad_timers[2] < 0 and cursor_y > chain_dist * 2 {
	//	cursor_y -= chain_dist
	//	global.dpad_timers[2] = 5
	//}
	//if obj_input.input_d and global.dpad_timers[3] < 0 and cursor_y < 18 * chain_dist { //array_length(global.json.chains[target_chain])
	//	cursor_y += chain_dist
	//	global.dpad_timers[3] = 5
	//}
}