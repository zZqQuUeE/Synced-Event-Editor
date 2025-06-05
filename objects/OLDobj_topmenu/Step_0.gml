var guiw = global.ui.guiw
var guih = global.ui.guih

gold_pattern_timer -= global.game.delta
if old_pattern != string_replace_all(string(global.target_pattern), " ", "") {
	old_pattern = string_replace_all(string(global.target_pattern), " ", "")
	gold_pattern_timer = 40
}

// save
if scr_button_check_pressed(20, 20, 200, 80) {
	var struct = []
	for (var i = 0; i < array_length(OLDobj_tracks.tracks); i++) {
		array_push(struct, {})
		struct_set(struct[i], "name", OLDobj_tracks.tracks[i])
		var arr = OLDobj_tracks.patterns[i]
		//array_copy(arr, 0, obj_tracks.patterns[i], 0, array_length(obj_tracks.patterns[i]))
		struct_set(struct[i], "patterns", arr)
	}
	if is_struct(global.json) or true { // i hate feather messages
		struct_set(global.json, "tracks", struct)
	}
	
	var json = json_stringify(global.json)
	clipboard_set_text(json)
	scr_play_button_sfx()
}
// load
if scr_button_check_pressed(230, 20, 410, 80) {
	var clipboard = clipboard_get_text()
	instance_destroy(OLDobj_tracks)
	try {
		global.json	= json_parse(clipboard)
	} catch(e) {
		show_debug_message(e)
	}
	instance_create_depth(0, 0, OLDobj_game.depth, OLDobj_tracks)
	audio_stop_all()
	scr_play_button_sfx()
}

// play and pause and stop
if scr_button_check_pressed(10, 140, 42, 172) {
	OLDobj_tracks.playing = true
}
if scr_button_check_pressed(50, 140, 82, 172) {
	OLDobj_tracks.playing = false
}
if scr_button_check_pressed(90, 140, 90 + 32, 172) {
	OLDobj_tracks.playing = false
	OLDobj_tracks.playpos = 0
}

// add track
if scr_button_check_pressed(guiw - 200 - 220, 20, guiw - 19 - 220, 80) {
	var track_name = "tr_" + string(array_length(OLDobj_tracks.tracks) )
	var track = array_create(1, {"note": "---","values":{}})
	//array_push(global.json.tracks, track)
	array_push(OLDobj_tracks.patterns, track)
	array_push(OLDobj_tracks.tracks, track_name)
	show_debug_message(OLDobj_tracks.patterns)
}

// set pattern
if scr_button_check_pressed(guiw - 200, 20, guiw - 19, 80) {
	var clipboard = clipboard_get_text()
	var tp = {}
	try {
		tp = json_parse(clipboard)
	} catch(e) {
		show_debug_message(e)
	}
	if struct_exists(tp, "note") and struct_exists(tp, "values") {
		global.target_pattern = tp
		scr_play_button_sfx()
	}
}