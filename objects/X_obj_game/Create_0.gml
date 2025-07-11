#region global values
global.game = {
	delta: 0
}

global.ui = {
	guiw: browser_width,
	guih: browser_height,
	
	rectangle_color_1: [c_black, c_black, c_black, c_black],
	rectangle_color_2: [c_white, c_white, c_white, c_white],
	boxthickness: 8,
	text_color_1: [c_white, c_white, #DDDDDD, #DDDDDD],
	text_color_2: [c_black, c_black, c_black, c_black],
	select_color: [c_yellow, c_yellow, c_white, c_white],
	
	font: font_add(working_directory + "gamefont.ttf", 12, 0, 0, 32, 128),
	//font_jp: font_add(working_directory + "gamejpfont.ttf", 60, 0, 0, 20, 40959),
	
	imageindex: 0,
	text_scale: 120 / 12,
	
	STRUCTEND: 0
}

global.camera = {
	width: 0,
	height: 0,
	xpos: 0,
	ypos: 0,
	scope: 1
}

global.misc = {
	// sound
	reverb_bus: audio_bus_create(),
	sfx_emitter: audio_emitter_create(),
	music_emitter: audio_emitter_create(),
	sfx_volume: 1,
	music_volume: 1,
	
	STRUCTEND: 0
}
global.music = mus_music

global.json = {"music_name":"GANEME - Ever Green","bpm":180.0,"spd":4.0,"offset":0.0,"loop_start":0.0,"loop_end":999999.0,"see_version":-1.0,"instruments":[{"name":"Dummy","object":"qwertyuiopasdfghjk","values":{}},{"name":"Flash 1","object":"se_flash","values":{"color":[0,0,100],"time":0.3,"alpha":0.5}},{"name":"Camera Beat 1","values":{"start_angle":0,"end_angle":0,"time":0.25,"start_zoom":1.1,"end_zoom":1}}],"channels":[{"name":"Main","chains":[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]},{"name":"Attacks","chains":[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]}],"chains":[[0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]],"phrases":[[1,0,0,0,2,0,0,0,2,0,0,0,2,0,0,0]]}

global.dpad_timers = [0, 0, 0, 0] // l r u d
//global.mbr = false // mb_right
//global.mbm = false // mb_middle
#endregion

#region audio emitters
var reveffect = audio_effect_create(AudioEffectType.Reverb1)
reveffect.size = 0.7
reveffect.mix = 0.5
global.misc.reverb_bus.effects[0] = reveffect
audio_emitter_bus(global.misc.sfx_emitter, global.misc.reverb_bus)
audio_emitter_bus(global.misc.music_emitter, global.misc.reverb_bus)
//audio_emitter_pitch(global.misc.sfx_emitter, global.game.gamespeed)
//audio_emitter_pitch(global.misc.music_emitter, global.game.gamespeed)
//audio_emitter_gain(global.misc.sfx_emitter, global.misc.sfx_volume)
//audio_emitter_gain(global.misc.music_emitter, global.misc.music_volume)
#endregion

#region values
page = 0
chain_dist = 30 // song, chain, phrase, instr, option
playing = false
play_pos = [0, 0] // chain, phrase
#endregion

#region instances
instance_create_depth(x, y, depth, X_obj_input)
instance_create_depth(x, y, depth, X_obj_gui_song)
instance_create_depth(x, y, depth, X_obj_gui_chain)
instance_create_depth(x, y, depth, X_obj_gui_phrase)
instance_create_depth(x, y, depth, X_obj_gui_instrument)
#endregion

scr_gui_init_font()