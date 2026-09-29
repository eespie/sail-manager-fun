extends Control

@onready var hud_dasboard: Control = %HUDDasboard
@onready var grid_container: GridContainer = %GridContainer

const TEAM_CHOOSER = preload("uid://b3nxt06yyw46f")

func _ready() -> void:
	_bind_events()
	Teams.init_teams()
	for team in Constant.TEAM_NAME.values():
		var team_node = TEAM_CHOOSER.instantiate()
		grid_container.add_child(team_node)
		team_node.set_team(Teams.all_teams[team])


func _bind_events() -> void:
	EventBus.sigTeamSelected.connect(_on_team_selected)


func _on_team_selected(_team_entity :TeamEntity) -> void:
	print(str("Team selected: ", _team_entity.team_res.team_name))
	Player.set_team_entity(_team_entity)
	hud_dasboard.show_continue_button(true)
	
