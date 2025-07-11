var guiw = global.ui.guiw
var guih = global.ui.guih

var chain_dist = X_obj_game.chain_dist

draw_set_halign(fa_left)
draw_set_valign(fa_top)
scr_draw_text_ui(5, 5 - gui_yoffset, global.json.music_name, 0.2, 0.2)

#region channels
draw_set_alpha(0.5)
for (var i = 0; i < guih + gui_yoffset + 100; i += chain_dist) {
	scr_draw_text_ui(5, 100 + i - gui_yoffset, scr_int_format(i/chain_dist), 0.3, 0.3)
}
draw_set_alpha(1)
var channels = global.json.channels
for (var i = 0; i < array_length(channels); i++) {
	scr_draw_text_ui(105 + 100 * i, 65 - gui_yoffset, string(channels[i].name), 0.2, 0.2)
	for (var ii = 0; ii < array_length(channels[i].chains); ii++) {
		scr_draw_text_ui(105 + 100 * i, 100 + chain_dist * ii - gui_yoffset, scr_int_format(channels[i].chains[ii]), 0.3, 0.3)
	}
}
#endregion

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

#region cursor
draw_set_color(c_blue)
draw_rectangle(cursor_x, cursor_y - gui_yoffset, cursor_x + cursor_width, cursor_y + cursor_height - gui_yoffset, true)
draw_set_color(c_white)
#endregion