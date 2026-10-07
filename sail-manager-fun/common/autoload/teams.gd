extends Node

# teams by enum value
var teams : Dictionary[int, TeamEntity]


func _ready() -> void:
	_bind_events()


func _bind_events() -> void:
	EventBus.sigAddMoney.connect(_on_add_money)
	EventBus.sigCrewHired.connect(_on_crew_hired)

func init_teams() -> void:
	for team_name in Constant.TEAM_NAME.keys():
		var team = TeamEntity.new()
		var resource = ResourceLoader.load(str("res://resources/team/team_",team_name.to_lower(),".tres"))
		team.set_team_resource(resource)
		teams[team.team_id] = team


func _on_add_money(_team_id : int, _amount :int) -> void:
	var team = teams[_team_id]
	team.add_money(_amount)


func _on_crew_hired(_team_id : int, _crew_id :int, _person : Dictionary) -> void:
	var team = teams[_team_id]
	team.crew_hired(_crew_id, _person)
