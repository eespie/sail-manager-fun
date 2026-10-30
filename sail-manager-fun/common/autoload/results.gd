extends Node
#class_name Results

var results : Dictionary = {}


func _from_dictionary(data : Dictionary) -> void:
	results = data


func _to_dictionary() -> Dictionary:
	return results


func load_results(path : String) -> void:
	_from_dictionary(File.load_data(path))


func save_results(path : String) -> void:
	File.save_data(_to_dictionary(), path)
