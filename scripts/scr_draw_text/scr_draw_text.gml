function scr_draw_text(_x, _y, text, xscale, yscale, angle, c1, c2, c3, c4, alpha) {
	// localizing
	txt = text
	//if ds_grid_value_exists(global.system_localizationdsgrid, 0, 0, 999999, 999999, text) {
	//	txt = ds_grid_get(global.system_localizationdsgrid, global.language, ds_grid_value_y(global.system_localizationdsgrid, 0, 0, 999999, 999999, text))
	//}
	
	// draw
	draw_text_transformed_color(_x, _y, txt, xscale * global.ui.text_scale, yscale * global.ui.text_scale, angle, c1, c2, c3, c4, alpha)
}