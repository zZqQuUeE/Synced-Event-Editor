function scr_draw_rectangle_ui(x1, y1, x2, y2) {
	draw_rectangle_color(x1 - global.ui.boxthickness, y1 - global.ui.boxthickness, x2 + global.ui.boxthickness, y2 + global.ui.boxthickness, global.ui.rectangle_color_2[0], global.ui.rectangle_color_2[1], global.ui.rectangle_color_2[2], global.ui.rectangle_color_2[3], false)
	draw_rectangle_color(x1, y1, x2, y2, global.ui.rectangle_color_1[0], global.ui.rectangle_color_1[1], global.ui.rectangle_color_1[2], global.ui.rectangle_color_1[3], false)
}