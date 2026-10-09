extends PanelContainer

@onready var bg_image: TextureRect = %"Bg Image"
@onready var crew_list: VBoxContainer = %"Crew List"

const DASHBOARD_PERSON = preload("uid://dlox18rg1kg60")


func _ready() -> void:
	var team : TeamEntity = Teams.get_team(Player.team_id)
	var team_res : TeamRes = team.team_res
	bg_image.texture = team_res.chooser_image
	for i in team.crew.keys():
		var person : PersonEntity = team.crew[i]
		var line = DASHBOARD_PERSON.instantiate()
		crew_list.add_child(line)
		line.init(person.person_role, person.person_name, '')
