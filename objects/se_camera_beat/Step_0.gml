timer -= 1 / 60 / global.game.delta
global.camera.scope = lerp(end_zoom, start_zoom, timer / time)
if timer <= 0 {
	global.camera.scope = end_zoom
	instance_destroy()
}