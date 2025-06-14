var guiw = global.ui.guiw
var guih = global.ui.guih

#region dpad
var size = 80
var offset = 30
var dist = 0.5
draw_set_alpha(0.5)
draw_set_color(c_gray)
for (var ii = 0; ii < 4; ii += dist) {
	for (var i = 0; i < 4; i += dist) {
		draw_rectangle(ii + offset, i + guih / 2 - size/2, ii + offset + size, i + guih / 2 + size/2, 1)
		draw_rectangle(ii + offset * 2 + size, i+ guih / 2 - size/2 - size - offset, ii + offset * 2 + size + size, i + guih / 2 + size/2 - size - offset, 1)
		draw_rectangle(ii + offset * 3 + size * 2, i + guih / 2 - size/2, ii + offset * 3 + 3 * size, i + guih / 2 + size/2, 1)
		draw_rectangle(ii + offset * 2 + size, i + guih / 2 - size/2 + size + offset, ii + offset * 2 + size + size, i + guih / 2 + size/2 + size + offset, 1)
	}
}
for (var ii = 0; ii < 4; ii += dist) {
	for (var i = 0; i < 4; i += dist) {
		draw_rectangle(guiw - (ii + offset), i + guih / 2 - size/2, guiw - (ii + offset + size), i + guih / 2 + size/2, 1)
		draw_set_alpha(0.05)
		draw_rectangle(guiw - (ii + offset * 2 + size), i+ guih / 2 - size/2 - size - offset, guiw - (ii + offset * 2 + size + size), i + guih / 2 + size/2 - size - offset, 1)
		draw_set_alpha(0.5)
		draw_rectangle(guiw - (ii + offset * 3 + size * 2) , i + guih / 2 - size/2, guiw - (ii + offset * 3 + 3 * size), i + guih / 2 + size/2, 1)
		//draw_rectangle(guiw - (ii + offset * 2 + size), i + guih / 2 - size/2 + size + offset, guiw - (ii + offset * 2 + size + size), i + guih / 2 + size/2 + size + offset, 1)
	}
}
draw_rectangle(guiw - 90, guih / 2 - size * 3, guiw - 90 + size, guih / 2 - size * 2, 0)
draw_set_alpha(1)
draw_set_color(c_white)

draw_sprite_stretched(spr_ui_play, image_index, guiw - 90, guih / 2 - size * 3, size, size)
draw_sprite_stretched(spr_ui_pause, image_index, 90-size, guih / 2 - size * 3, size, size)
//draw_sprite_stretched(spr_ui_play, image_index, guiw - offset/2, guiw - size*3, size, size)
#endregion

#region a b ab
#endregion

#region select start
#endregion