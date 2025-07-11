var guiw = global.ui.guiw
var guih = global.ui.guih

var chain_dist = X_obj_game.chain_dist

draw_set_halign(fa_left)
draw_set_valign(fa_top)
scr_draw_text_ui(5, 5, "Instr  " + scr_int_format(target_instr) + " - " + global.json.instruments[target_instr].name, 0.2, 0.2)

#region inst

#endregion

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

#region cursor
draw_set_color(c_blue)
draw_rectangle(cursor_x, cursor_y, cursor_x + cursor_width, cursor_y + cursor_height, true)
draw_set_color(c_white)
#endregion