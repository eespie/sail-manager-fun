extends Control

@onready var hud_dasboard: Control = %HUDDasboard
@onready var grid_container: GridContainer = %GridContainer

const TEAM_CHOOSER = preload("uid://b3nxt06yyw46f")

func _ready() -> void:
	_bind_events()
	Teams.init_teams()
	for team in Teams.teams.keys():
		var team_node = TEAM_CHOOSER.instantiate()
		grid_container.add_child(team_node)
		team_node.set_team(Teams.teams[team])


func _bind_events() -> void:
	EventBus.sigTeamSelected.connect(_on_team_selected)
	EventBus.sigPrepareContinue.connect(_on_before_continue)


func _on_team_selected(_team_entity :TeamEntity) -> void:
	hud_dasboard.show_continue_button(true)
	hud_dasboard.team.text = str("Team ", _team_entity.team_res.team_full_name)
	hud_dasboard._on_money_changed(Player.team_id, _team_entity.current_money)


func _on_before_continue() -> void:
	# Allocate crew on every team before the one choosen by the player
	for team_id in Teams.teams.keys():
		if team_id == Player.team_id:
			break
		# select crew
		var team : TeamEntity = Teams.teams[team_id]
		team.auto_select_crew()
	# the screen after crew management is sponsors
	Scene.add_scene_data("next_scene", "uid://b0035vf3m26mc")
