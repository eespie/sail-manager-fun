extends Node

var WIDTH = ProjectSettings.get_setting("display/window/size/viewport_width")
var HEIGHT = ProjectSettings.get_setting("display/window/size/viewport_height")

var play_sfx = true
var play_music = true
var fullscreen = false


func save_data(path : String) -> void:
	var data : Dictionary = {
		"play_sfx": play_sfx,
		"play_music": play_music,
		"fullscreen": fullscreen
	}
	
	File.save_data(data, path)


func load_data(path : String) -> void:
	var data = File.load_data(path)
	if data == {}:
		play_sfx = true
		play_music = true
		fullscreen = false
		return
		
	play_sfx = data["play_sfx"]
	play_music = data["play_music"]
	fullscreen = data["fullscreen"]


func apply() -> void:
	var mode := DisplayServer.window_get_mode()
	var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
	if fullscreen && is_window:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if not fullscreen and not is_window:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
