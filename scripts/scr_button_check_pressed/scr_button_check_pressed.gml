function scr_button_check_pressed(x1, y1, x2, y2, devices = 5) {
	var value = false
	//if false and keyboard_check(ord("U")) {
	//	draw_set_alpha(0.4)
	//	draw_rectangle_color(x1, y1, x2, y2, c_upurple, c_purple, c_purple, c_purple, 0)
	//	draw_set_alpha(1)
	//}
	for (var i = 0; i < devices; i++) {
		if device_mouse_check_button_pressed(i, mb_left) {
			var touchx = device_mouse_x_to_gui(i)
			var touchy = device_mouse_y_to_gui(i)
			if touchx > x1 and touchx < x2 {
				if touchy > y1 and touchy < y2 {
					value = true
					break
				}
			}
		}
	}
	return value
}