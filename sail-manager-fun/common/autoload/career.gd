extends Node
#class_name Career


func _from_dictionary(data : Dictionary) -> void:
	pass


func _to_dictionary() -> Dictionary:
	var data : Dictionary = {}
	return data


func load_career(path : String) -> void:
	_from_dictionary(File.load_data(path))


func save_career(path : String) -> void:
	File.save_data(_to_dictionary(), path)
