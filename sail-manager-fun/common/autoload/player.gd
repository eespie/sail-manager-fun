extends Node

var team_id : int

func _ready() -> void:
	_bind_events()


func _bind_events() -> void:
	EventBus.sigTeamSelected.connect(_on_team_selected)


func _on_team_selected(_team_entity :TeamEntity) -> void:
	print(str("Team selected: ", _team_entity.team_res.team_name))
	set_team_entity(_team_entity)


func set_team_entity(_team : TeamEntity) -> void:
	team_id = _team.team_id


func _from_dictionary(data : Dictionary) -> void:
	team_id = data["team_id"]


func _to_dictionary() -> Dictionary:
	var data : Dictionary = {
		"team_id": team_id,
	}
	return data

func load_player(path : String) -> void:
	_from_dictionary(File.load_data(path))


func save_player(path : String) -> void:
	File.save_data(_to_dictionary(), path)
