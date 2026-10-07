extends Control

@onready var crew_list: GridContainer = $Panel/GridContainer

func _ready() -> void:
	_init_from_player()


func _init_from_player() -> void:
	var team = Teams.teams[Player.team_id]
	for crew in crew_list.get_children():
		var crew_id = crew.crew_id
		if team.crew.has(crew_id):
			crew.init_from_person_entity(team.crew[crew_id])
