class_name GameDataFile
extends Node

@export var save_file = "user://file.save"


func save_data(savedict) -> void:
	var savegame = FileAccess.open(save_file, FileAccess.WRITE)
	savegame.store_line(JSON.stringify(savedict))
	savegame.close()


func load_data() -> Dictionary:
	if not FileAccess.file_exists(save_file):
		return {}
	var savedict = {}
	var content = FileAccess.get_file_as_string(save_file)
	savedict = JSON.parse_string(content)
	return savedict
