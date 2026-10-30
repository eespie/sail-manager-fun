extends Node
#class_name Career

var next_event : Dictionary = {
	"season": 1,
	"event": 1,
	"race": 1,
}


func _from_dictionary(data : Dictionary) -> void:
	next_event = data


func _to_dictionary() -> Dictionary:
	return next_event


func load_career(path : String) -> void:
	_from_dictionary(File.load_data(path))


func save_career(path : String) -> void:
	File.save_data(_to_dictionary(), path)
