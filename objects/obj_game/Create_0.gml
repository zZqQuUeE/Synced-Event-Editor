#region global values
global.target_pattern = {
  "note": "---",
  "values": {}
}

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
global.json = {"see_version":-1,"version":0,"music_name":"DJ Noriken - Elektrick U-Phoria","bpm":180,"spd":4,"offset":1.47,"loop_start":0,"loop_end":999999,"loop":false,"tracks":[{"name":"tr_attacks_1","patterns":[{"note":"bullet","values":{"type":1}}]},{"name":"tr_effects_1","patterns":[{"note":"flash","values":{"alpha":0.5}}]}]}

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

scr_gui_init_font()