var guiw = global.ui.guiw
var guih = global.ui.guih

var chain_dist = X_obj_game.chain_dist

draw_set_halign(fa_left)
draw_set_valign(fa_top)
scr_draw_text_ui(5, 5, "Phrase  " + scr_int_format(target_phrase), 0.2, 0.2)

#region phrases
draw_set_alpha(0.5)
for (var i = 0; i < 16 * chain_dist; i += chain_dist) {
	scr_draw_text_ui(5, 100 + i, scr_int_format(i/chain_dist), 0.3, 0.3)
}
draw_set_alpha(1)
var phrases = global.json.phrases[target_phrase]
for (var i = 0; i < array_length(phrases); i++) {
	scr_draw_text_ui(105, 100 + chain_dist * i, scr_int_format(phrases[i]), 0.3, 0.3)
}
#endregion

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

#region cursor
draw_set_color(c_blue)
draw_rectangle(cursor_x, cursor_y, cursor_x + cursor_width, cursor_y + cursor_height, true)
draw_set_color(c_white)
#endregion