// fps lock
if game_get_speed(gamespeed_fps) != 60 {
	game_set_speed(60, gamespeed_fps)
}
global.game.delta = 1//60 / game_get_speed(gamespeed_fps) * delta_time / 1000000 * 60

var scope = 1
if browser_width / 1280 > browser_height / 720 {
	scope = browser_height / 720
} else {
	scope = browser_width / 1280
}
camera_set_view_size(view_camera[0], browser_width / scope / 2/ global.camera.scope + global.camera.width, browser_height / scope / 2 / global.camera.scope + global.camera.height)
global.ui.guiw = browser_width / scope
global.ui.guih = browser_height / scope
display_set_gui_size(global.ui.guiw, global.ui.guih)
var camx = x - (camera_get_view_width(view_camera[0]) / 2)
if camx <= 0 { camx = 0 }
if camx >= room_width - camera_get_view_width(view_camera[0]) {
	camx = room_width - camera_get_view_width(view_camera[0])
}
var camy = y - (camera_get_view_height(view_camera[0]) / 2)
if camy <= 0 { camy = 0 }
if camy >= room_height - camera_get_view_height(view_camera[0]) {
	camy = room_height - camera_get_view_height(view_camera[0])
}
camera_set_view_pos(view_camera[0], camx, camy)