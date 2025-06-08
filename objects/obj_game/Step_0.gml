for (var i = 0; i < array_length(global.dpad_timers); i++) {
	global.dpad_timers[i] -= 1
}

if obj_input.input_start {
	playing = not playing
	play_pos = [0, 0] // TODO
	if playing {
		audio_play_sound_on(global.misc.music_emitter, mus_music, 0, 0)
	} else {
		audio_stop_all()
	}
}