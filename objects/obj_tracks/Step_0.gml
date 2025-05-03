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
	
	var pattern_index = (playpos * (global.json.bpm / 60)) * global.json.spd
	if old_pattern_index != floor(pattern_index) {
		old_pattern_index = floor(pattern_index)
		for (var i = 0; i < array_length(patterns); i++) {
			if array_length(patterns[i]) > pattern_index {
				var asset = asset_get_index("se_" + patterns[i][pattern_index].note)
				if asset {
					instance_create_depth(0, 0, -1000, asset, patterns[i][pattern_index].values)
				}
			}
		}
	}
} else {
	if old_playing {
		old_playing = false
		old_pattern_index = -999
		audio_stop_sound(global.music)
	}
}
#endregion

#region edit
if keyboard_check_pressed(vk_space) {
	editing = not editing
}
var mousex = device_mouse_x_to_gui(0)
var mousey = device_mouse_y_to_gui(0)
if editing {
	if mousey > 190 {
		if floor(mousex / track_gap) < array_length(tracks) {
			var tp = global.target_pattern
			if mouse_check_button_pressed(mb_right) {
				tp = {
					"note": "---",
					"values": {}
				}
			}
			if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) {
				var len = array_length(patterns[floor(mousex / track_gap)])
				var ind = clamp(floor((-scroll + mousey - 200) / pattern_gap), 0, len)
				if ind == len {
					array_insert(patterns[floor(mousex / track_gap)], ind, tp)
				} else {
					array_set(patterns[floor(mousex / track_gap)], ind, tp)
				}
			}
		}
	}
}
if mouse_check_button_pressed(mb_middle) {
	var len = array_length(patterns[floor(mousex / track_gap)])
	var ind = clamp(floor((-scroll + mousey - 200) / pattern_gap), 0, len)
	if ind < len {
		global.target_pattern = patterns[floor(mousex / track_gap)][ind]
		clipboard_set_text(global.target_pattern)
	}
}
#endregion
//show_debug_message(struct)