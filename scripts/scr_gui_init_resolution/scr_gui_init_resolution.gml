function scr_gui_init_resolution() {
	// resolution
	var scope = 1
	if browser_width / 1280 > browser_height / 720 {
		scope = browser_height / 720
	} else {
		scope = browser_width / 1280
	}
	global.ui.guiw = browser_width / scope
	global.ui.guih = browser_height / scope
	display_set_gui_size(global.ui.guiw, global.ui.guih)
}