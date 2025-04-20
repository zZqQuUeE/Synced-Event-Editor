var guiw = global.ui.guiw
var guih = global.ui.guih

scr_draw_rectangle_ui(0, 0, guiw, 180)
scr_draw_rectangle_ui(20, 20, 200, 80)
scr_draw_text_ui(lerp(20, 200, 0.5), 50, "Save", 0.2, 0.2)
scr_draw_rectangle_ui(230, 20, 410, 80)
scr_draw_text_ui(lerp(230, 410, 0.5), 50, "Load", 0.2, 0.2)
draw_set_halign(fa_left)
scr_draw_text_ui(10, 100, "BPM: " + string(global.json.bpm), 0.15, 0.15)
scr_draw_text_ui(10, 120, "Speed: " + string(global.json.spd), 0.15, 0.15)
draw_set_halign(fa_center)

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
//scr_draw_text_ui(10, 140, "Song: " + audio_get_name(mus_sakurite), 0.15, 0.15)