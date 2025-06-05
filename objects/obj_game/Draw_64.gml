var guiw = global.ui.guiw
var guih = global.ui.guih

if keyboard_check_pressed(ord("Y")) {
	show_debug_message("------------")
	show_debug_message("Mouse GUI X: " + string(device_mouse_x_to_gui(0)))
	show_debug_message("Mouse GUI Y: " + string(device_mouse_y_to_gui(0)))
	show_debug_message("Mouse GUI X (center ori): " + string(guiw / 2 - device_mouse_x_to_gui(0)))
	show_debug_message("Mouse GUI Y (center ori): " + string(guih / 2 - device_mouse_y_to_gui(0)))
}

draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(-999, -999, guiw, guih, false)
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
scr_draw_text_ui(5, 5, global.json.music_name, 0.2, 0.2)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)