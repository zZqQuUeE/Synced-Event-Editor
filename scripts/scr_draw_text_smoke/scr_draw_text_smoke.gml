function scr_draw_text_smoke(_x, _y, text, xscale, yscale, c1, c2, thick, alpha) {
	// localizing
	txt = text
	//if ds_grid_value_exists(global.system_localizationdsgrid, 0, 0, 999999, 999999, text) {
	//	txt = ds_grid_get(global.system_localizationdsgrid, global.language, ds_grid_value_y(global.system_localizationdsgrid, 0, 0, 999999, 999999, text))
	//}
	
	// draw
	draw_text_transformed_color(_x - thick, _y, txt, xscale * global.ui.text_scale, yscale * global.ui.text_scale, 0, c2[0], c2[1], c2[2], c2[3], alpha)
	draw_text_transformed_color(_x + thick, _y, txt, xscale * global.ui.text_scale, yscale * global.ui.text_scale, 0, c2[0], c2[1], c2[2], c2[3], alpha)
	draw_text_transformed_color(_x, _y + thick, txt, xscale * global.ui.text_scale, yscale * global.ui.text_scale, 0, c2[0], c2[1], c2[2], c2[3], alpha)
	draw_text_transformed_color(_x, _y - thick, txt, xscale * global.ui.text_scale, yscale * global.ui.text_scale, 0, c2[0], c2[1], c2[2], c2[3], alpha)
	draw_text_transformed_color(_x, _y, txt, xscale * global.ui.text_scale, yscale * global.ui.text_scale, 0, c1[0], c1[1], c1[2], c1[3], alpha)
}