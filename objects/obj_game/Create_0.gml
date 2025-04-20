#region global values
global.ui = {
	guiw: browser_width,
	guih: browser_height,
	
	rectangle_color_1: [c_black, c_black, c_black, c_black],
	rectangle_color_2: [c_white, c_white, c_white, c_white],
	boxthickness: 8,
	text_color_1: [c_white, c_white, #DDDDDD, #DDDDDD],
	text_color_2: [c_black, c_black, c_black, c_black],
	
	font: font_add(working_directory + "gamefont.ttf", 12, 0, 0, 32, 128),
	//font_jp: font_add(working_directory + "gamejpfont.ttf", 60, 0, 0, 20, 40959),
	
	imageindex: 0,
	text_scale: 120 / 12,
	
	STRUCTEND: 0
}

global.music = mus_sakurite
global.json = {"see_version":-1,"version":0,"bpm":170,"spd":4,"loop_start":0,"loop_end":999999,"loop":false,"tracks":[{"name":"tr_attacks_1","patterns":[{"note":"bullet","values":{"type":1}}]},{"name":"tr_effects_1","patterns":[{"note":"flash","values":{"alpha":0.5}}]}]}
#endregion

scr_gui_init_resolution()
scr_gui_init_font()