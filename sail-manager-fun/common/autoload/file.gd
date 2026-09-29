extends Node

#var save_file = "user://file.save"

func save_data(savedict : Dictionary, save_file : String) -> void:
	var savegame = FileAccess.open(save_file, FileAccess.WRITE)
	savegame.store_line(JSON.stringify(savedict))
	savegame.close()

func load_data(save_file : String) -> Variant:
	if not FileAccess.file_exists(save_file):
		return {}
	var savedict = {}
	var content = FileAccess.get_file_as_string(save_file)
	savedict = JSON.parse_string(content)
	return savedict
