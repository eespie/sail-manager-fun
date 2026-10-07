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
