var guiw = global.ui.guiw
var guih = global.ui.guih

scr_draw_rectangle_ui(0, 0, guiw, 180)
for (var i = 0; i <= 3; i++) {
	scr_draw_rectangle_ui(20 + i * 50, guih - 50, 50 + i * 50, guih - 20, 0.5)
	scr_draw_text_ui(lerp(20 + i * 50, 50 + i * 50, 0.5), guih - 35, i, 0.2, 0.2)
}

if page == 0 {
	scr_draw_rectangle_ui(20, 20, 200, 80)
	scr_draw_text_ui(lerp(20, 200, 0.5), 50, "Save", 0.3, 0.3)
	scr_draw_rectangle_ui(230, 20, 410, 80)
	scr_draw_text_ui(lerp(230, 410, 0.5), 50, "Load", 0.3, 0.3)
	
	draw_set_halign(fa_left)
	scr_draw_text_ui(10, 100, "BPM: " + string_format(global.json.bpm, 0, 1), 0.15, 0.15)
	scr_draw_text_ui(10, 120, "Instance Count: " + string(instance_count), 0.15, 0.15)
	draw_set_halign(fa_right)
	scr_draw_text_ui(guiw - 10, 160, "Song: " + global.json.music_name, 0.15, 0.15)
	draw_set_halign(fa_center)

	scr_draw_rectangle_ui(guiw - 200, 20, guiw - 19, 80)
	scr_draw_text_ui(lerp(guiw - 200, guiw - 10, 0.5), 50, "Set\nPattern", 0.2, 0.2)
	draw_set_halign(fa_right)
	scr_draw_text_ui(guiw - 10, 100, string_replace_all(string(global.target_pattern), " ", ""), 0.1, 0.1)
	if gold_pattern_timer > 0 {
		scr_draw_text_smoke(guiw - 10, 100, string_replace_all(string(global.target_pattern), " ", ""), 0.1, 0.1, [c_yellow, c_yellow, c_yellow, c_yellow], global.ui.text_color_2, 2, gold_pattern_timer / 40)
	}
	draw_set_halign(fa_center)
	draw_set_color(c_white)
	draw_set_alpha(1)

	scr_draw_rectangle_ui(guiw - 200 - 220, 20, guiw - 19 - 220, 80)
	scr_draw_text_ui(lerp(guiw - 200, guiw - 10, 0.5)-220, 50, "Add\nTrack", 0.2, 0.2)

	if obj_tracks.playing {
	draw_set_alpha(0.5)
	}
	draw_sprite_stretched(spr_ui_play, 0, 10, 140, 32, 32)
	if not obj_tracks.playing {
		draw_set_alpha(0.5)
	} else {
		draw_set_alpha(1)
	}
	draw_sprite_stretched(spr_ui_pause, 0, 50, 140, 32, 32)
	draw_set_alpha(1)
	draw_sprite_stretched(spr_ui_stop, 0, 90, 140, 32, 32)
}
	
if page == 1 {
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	scr_draw_text_ui(0, 0, global.json.description, 0.2, 0.2, 0, 0.5 + 0.5 * max(gold_desc_timer, 0)/40)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
}
	
if page == 2 {
	var pos = timeline_pos
	for (var i = 0; i < guiw; i++) {
		var bozo = 12
		if i % 4 == 0 {
			bozo = 30
		}
		draw_line(10 + i * 40, 180 - bozo, 10 + i * 40, 180)
	}
}