for (var i = 0; i < array_length(global.dpad_timers); i++) {
	global.dpad_timers[i] -= 1
}

if obj_input.input_start {
	playing = not playing
}