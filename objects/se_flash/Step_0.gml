alpha -= start_alpha / (60*time)
if alpha <= 0 { instance_destroy() }