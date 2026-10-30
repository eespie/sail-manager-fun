extends Node
#class_name Career

var next_event : Dictionary[String, int] = {
	"season": 1,
	"event": 1,
	"race": 1,
}

var season_res : SeasonRes
var event_res : EventRes
var race_res : RaceRes

func init_resources() -> void:
	var seasons_res : SeasonsRes = ResourceLoader.load("res://resources/seasons/seasons.tres")
	season_res = seasons_res.seasons[next_event["season"] - 1]
	event_res = season_res.season_events[next_event["event"] - 1]
	race_res = event_res.event_races[next_event["race"] - 1]

func _from_dictionary(data : Dictionary) -> void:
	next_event = {}
	for key in data.keys():
		next_event[key] = int(data[key])
	init_resources()


func _to_dictionary() -> Dictionary:
	return next_event


func load_career(path : String) -> void:
	_from_dictionary(File.load_data(path))


func save_career(path : String) -> void:
	File.save_data(_to_dictionary(), path)
