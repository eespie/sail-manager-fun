extends Node

# teams by enum value
var all_teams : Dictionary[Constant.TEAM_NAME, TeamEntity]

const TEAM_ENTITY = preload("uid://cpjtis7jooctw")


func init_teams() -> void:
	for team_name in Constant.TEAM_NAME.keys():
		var team = TEAM_ENTITY.instantiate()
		var resource = ResourceLoader.load(str("res://resources/team/team_",team_name.to_lower(),".tres"))
		team.set_team_resource(resource)
		all_teams[Constant.TEAM_NAME[team_name]] = team
