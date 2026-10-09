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
	var team = get_team(_team_id)
	team.add_money(_amount)


func _on_crew_hired(_team_id : int, _crew_id :int, _person : Dictionary) -> void:
	var team = get_team(_team_id)
	team.crew_hired(_crew_id, _person)


func get_team(team_id : int) -> TeamEntity:
	return teams[team_id]


func _from_dictionary(data : Dictionary) -> void:
	teams = {}
	for team_id in data.keys():
		var team_entity = TeamEntity._from_dictionary(data[team_id])
		teams[int(team_id)] = team_entity


func _to_dictionary() -> Dictionary:
	var data : Dictionary
	for team_id in teams.keys():
		data[team_id] = teams[team_id]._to_dictionary()
	return data

func load_teams(path : String) -> void:
	_from_dictionary(File.load_data(path))


func save_teams(path : String) -> void:
	File.save_data(_to_dictionary(), path)
