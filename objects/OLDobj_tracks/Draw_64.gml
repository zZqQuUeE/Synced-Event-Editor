var guiw = global.ui.guiw
var guih = global.ui.guih

draw_set_color(c_black)
draw_set_alpha(0.9)
draw_rectangle(0, 0, guiw, guih, 0)
draw_set_alpha(1)
draw_set_color(c_white)

#region draw channels
//var width = 170
var textsize = 0.2
draw_set_halign(fa_left)
for (var ii = 0; ii < array_length(tracks); ii++) {
	var xindex = ii * track_gap + h_scroll
	for (var i = 0; i < array_length(patterns[ii]); i++) {
		scr_draw_text_ui(xindex, scroll + 215 + pattern_gap * i, string(i), textsize, textsize, 0, 0.5)
		var txt = string(patterns[ii][i].note)
		if patterns[ii][i].note == "function" {
			txt = txt + " (" + string(patterns[ii][i].values.index) + ")"
		}
		scr_draw_text_ui(xindex + 50, scroll + 215 + pattern_gap * i, txt, textsize, textsize, 0, 1)
		draw_set_alpha(0.3)
		//draw_line(xindex, scroll + 215 + pattern_gap * i - pattern_gap/2, xindex + track_gap, scroll + 215 + pattern_gap * i - pattern_gap/2)
		draw_line(xindex, scroll + 215 + pattern_gap * i + pattern_gap/2, xindex + track_gap, scroll + 215 + pattern_gap * i + pattern_gap/2)
		draw_set_alpha(1)
	}
}
draw_set_halign(fa_center)
//for (var i = 0; i <= channels; i++) {
//	if i == 0 {
//		// TODO chain preview
//	} else {
//		scr_draw_rectangle_ui(width * i, 200, width * (i+1), guih)
		
//	}
//}
#endregion

#region draw cursor
var ypos = floor((215 + (playpos * (global.json.bpm / 60)) * global.json.spd * pattern_gap) / pattern_gap) * pattern_gap + 5
//if playing {
//	ypos = floor((215 + (playpos * (global.json.bpm / 60)) * global.json.spd * pattern_gap) / pattern_gap) * pattern_gap + 5
//}
//else {
//	ypos = -scroll + 215//floor((215 + (scroll * (global.json.bpm / 60)) * global.json.spd * pattern_gap) / pattern_gap) * pattern_gap
//}
if OLDobj_topmenu.gold_pattern_timer > 0 {
	draw_set_color(c_yellow)
	draw_set_alpha(OLDobj_topmenu.gold_pattern_timer / 60)
	draw_rectangle(0, scroll + ypos - pattern_gap/2, guiw, scroll + ypos + pattern_gap/2, false)
}
if not editing {
	draw_set_color(c_blue)
	draw_set_alpha(0.3)
	draw_rectangle(0, scroll + ypos - pattern_gap/2, guiw, scroll + ypos + pattern_gap/2, false)
} else {
	draw_set_color(c_red)
	draw_set_alpha(0.3)
	draw_rectangle(0, scroll + ypos - pattern_gap/2, guiw, scroll + ypos + pattern_gap/2, false)
	draw_set_alpha(1)
	draw_rectangle(3, 3, guiw - 3, guih - 3, true)
}
draw_set_alpha(1)
draw_set_color(c_white)
#endregion