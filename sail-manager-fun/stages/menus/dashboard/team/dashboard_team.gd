extends PanelContainer

@onready var team_name: Label = %"Team Name"
@onready var bg_image: TextureRect = %"Bg Image"
@onready var credits_value: Label = %"Credits Value"


func _ready() -> void:
	var team = Teams.get_team(Player.team_id)
	var team_res : TeamRes = team.team_res
	team_name.text = str("Team ", team_res.team_full_name)
	bg_image.texture = team_res.flag_square
	credits_value.text = Utils.format_money(team.current_money)
