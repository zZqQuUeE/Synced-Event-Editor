#region values
patterns = []//array_create(2, array_create(99, {"note":"bullet","values":{"type":1.0}}))
tracks = []
for (var i = 0; i < array_length(global.json.tracks); i++) {
	array_push(tracks, global.json.tracks[i].name)
	array_push(patterns, global.json.tracks[i].patterns)
	//for (var ii = 0; ii < array_length(global.json.tracks[i].patterns); ii++) {
	//	array_push(patterns[i], global.json.tracks[i].patterns[ii])
	//}
}
scroll = 0
h_scroll = 0 // horizontal scroll

track_gap = 300
pattern_gap = 30

playpos = 0
playing = false
old_playing = false
editing = false

old_pattern_index = -999
#endregion