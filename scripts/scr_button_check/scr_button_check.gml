function scr_button_check(x1, y1, x2, y2, devices = 5) {
	var value = false
	//if false and keyboard_check(ord("U")) {
	//	draw_set_alpha(0.4)
	//	draw_rectangle_color(x1, y1, x2, y2, c_upurple, c_purple, c_purple, c_purple, 0)
	//	draw_set_alpha(1)
	//}
	for (var i = 0; i < devices; i++) {
		if device_mouse_check_button(i, mb_left) {
			var touchx = device_mouse_x_to_gui(i)
			var touchy = device_mouse_y_to_gui(i)
			if clamp(touchx, x1, x2) == touchx or clamp(touchx, x2, x1) == touchx {
				if clamp(touchy, y1, y2) == touchy or clamp(touchy, y2, y1) == touchy {
					value = true
					break
				}
			}
		}
	}
	return value
}