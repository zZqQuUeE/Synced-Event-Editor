var guiw = global.ui.guiw
var guih = global.ui.guih

#region scroll
if mouse_wheel_down() {
	scroll -= 30
}
if keyboard_check(vk_down) {
	scroll -= 150
}
if mouse_wheel_up() {
	scroll += 30
}
if keyboard_check(vk_up) {
	scroll += 150
}
scroll = clamp(scroll, -99999, 0) // TODO -30 * array_length(patterns) - 50
#endregion

#region play
if playing {
	if not old_playing {
		old_playing = true
		audio_play_sound_on(global.misc.music_emitter, global.music, 1, 0, 1, playpos + global.json.offset)
	}
	playpos += delta_time / 1000000
} else {
	if old_playing {
		old_playing = false
		audio_stop_sound(global.music)
	}
}
#endregion

#region edit
if keyboard_check_pressed(vk_space) {
	editing = not editing
}
if editing {
	var mousex = device_mouse_x_to_gui(0)
	var mousey = device_mouse_y_to_gui(0)
	if mousey > 190 {
		if floor(mousex / track_gap) < array_length(tracks) {
			if mouse_check_button_pressed(mb_left) {
				var len = array_length(patterns[floor(mousex / track_gap)])
				var ind = clamp(floor((-scroll + mousey - 200) / pattern_gap), 0, len)
				show_debug_message(ind)
				if ind == len {
					array_insert(patterns[floor(mousex / track_gap)], ind, {"note":"---","values":{}})
				} else {
					array_set(patterns[floor(mousex / track_gap)], ind, {"note":"---","values":{}})
				}
			}
		}
	}
}
#endregion
//show_debug_message(struct)