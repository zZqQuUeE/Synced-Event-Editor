input_select = keyboard_check(vk_shift)
input_start = keyboard_check_pressed(vk_enter)
input_a = keyboard_check_pressed(ord("S"))
input_b = keyboard_check_pressed(ord("A"))
input_ah = keyboard_check(ord("S"))
input_bh = keyboard_check(ord("A"))
input_l = keyboard_check(vk_left)
input_r = keyboard_check(vk_right)
input_u = keyboard_check(vk_up)
input_d = keyboard_check(vk_down)

//draw_rectangle(offset, guih / 2 - size/2, offset + size, guih / 2 + size/2, false)
//draw_rectangle(offset * 2 + size, guih / 2 - size/2 - size - offset, offset * 2 + size + size, guih / 2 + size/2 - size - offset, false)
//draw_rectangle(offset * 3 + size * 2, guih / 2 - size/2, offset * 3 + 3 * size, guih / 2 + size/2, false)
//draw_rectangle(offset * 2 + size, guih / 2 - size/2 + size + offset, offset * 2 + size + size, guih / 2 + size/2 + size + offset, false)
var guiw = global.ui.guiw
var guih = global.ui.guih
var size = 80
var offset = 30
var ii = 0
var i = 0
if scr_button_check(offset, guih / 2 - size/2, offset + size, guih / 2 + size/2) {
	input_l = true
}
if scr_button_check(offset * 2 + size, guih / 2 - size/2 - size - offset, offset * 2 + size + size, guih / 2 + size/2 - size - offset) {
	input_u = true
}
if scr_button_check(offset * 3 + size * 2, guih / 2 - size/2, offset * 3 + 3 * size, guih / 2 + size/2) {
	input_r = true
}
if scr_button_check(offset * 2 + size, guih / 2 - size/2 + size + offset, offset * 2 + size + size, guih / 2 + size/2 + size + offset) {
	input_d = true
}

if scr_button_check(guiw - (ii + offset), i + guih / 2 - size/2, guiw - (ii + offset + size), i + guih / 2 + size/2) {
	input_ah = true
}
if scr_button_check_pressed(guiw - (ii + offset), i + guih / 2 - size/2, guiw - (ii + offset + size), i + guih / 2 + size/2) {
	input_a = true
}
if scr_button_check(guiw - (ii + offset * 3 + size * 2) , i + guih / 2 - size/2, guiw - (ii + offset * 3 + 3 * size), i + guih / 2 + size/2) {
	input_bh = true
}
if scr_button_check_pressed(guiw - (ii + offset * 3 + size * 2) , i + guih / 2 - size/2, guiw - (ii + offset * 3 + 3 * size), i + guih / 2 + size/2) {
	input_b = true
}
if scr_button_check(guiw - (ii + offset * 2 + size), i+ guih / 2 - size/2 - size - offset, guiw - (ii + offset * 2 + size + size), i + guih / 2 + size/2 - size - offset) {
	input_ah = true
	input_bh = true
}
if scr_button_check_pressed(guiw - (ii + offset * 2 + size), i+ guih / 2 - size/2 - size - offset, guiw - (ii + offset * 2 + size + size), i + guih / 2 + size/2 - size - offset) {
	input_a = true
	input_b = true
}

if scr_button_check_pressed(guiw - 90, guih / 2 - size * 3, guiw - 90 + size, guih / 2 - size * 2) {
	input_start = true
}
if scr_button_check(90-size, guih / 2 - size * 3, 90, guih / 2 - size * 2) {
	input_select = true
}