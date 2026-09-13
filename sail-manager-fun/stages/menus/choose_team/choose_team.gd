extends Control

@export var nextScene :String

@onready var hud_dasboard: Control = %HUDDasboard

func _ready() -> void:
	_bind_events()


func _bind_events() -> void:
	EventBus.sigTeamSelected.connect(_on_team_selected)


func _on_team_selected(team_info :TeamRes) -> void:
	print(str("Team selected: ", team_info.team_name))
	Player.set_team_info(team_info)
	hud_dasboard.show_continue_button(true)
	
