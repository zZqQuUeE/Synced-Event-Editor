alpha -= start_alpha / (60*time) * global.game.delta
if alpha <= 0 { instance_destroy() }