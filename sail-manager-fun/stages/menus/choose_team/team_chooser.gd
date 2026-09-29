extends Control
class_name TeamChooser

@onready var boat: TextureRect = %Boat
@onready var amount: Label = %Amount
@onready var team_name: Label = %TeamName
@onready var panel: Panel = %Panel

var team_entity: TeamEntity
var tween: Tween
var mousePressed: bool = false
var mouseEntered: bool = false
var is_selected: bool = false

func _ready() -> void:
	offset_transform_enabled = true
	_bind_events()


func _bind_events() -> void:
	EventBus.sigTeamSelected.connect(_on_other_team_selected)


func set_team(_team_entity : TeamEntity) -> void:
	team_entity = _team_entity
	var team_res = team_entity.team_res
	boat.texture = team_res.chooser_image
	team_name.text = team_res.team_name
	amount.text = str("$ ", team_res.start_amount_money)	


func _on_mouse_entered() -> void:
	if tween and tween.is_running():
		tween.kill()
	self.z_index = 1
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)
	tween.tween_property(self, "offset_transform_scale:x", 1.15, 0.15)
	tween.tween_property(self, "offset_transform_scale:y", 1.15, 0.15)
	mouseEntered = true
	mousePressed = false


func _on_mouse_exited() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)
	tween.tween_property(self, "offset_transform_scale", Vector2.ONE, 0.15)
	self.z_index = 0
	mouseEntered = false


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and mouseEntered:
			if mousePressed and not event.pressed:
				is_selected = true
				panel.theme_type_variation = "SelectionSelected"
				EventBus.sigTeamSelected.emit(team_entity)
			mousePressed = event.pressed


func _on_other_team_selected(_team : TeamEntity) -> void :
	if _team.team_res.team_full_name == team_entity.team_res.team_full_name:
		return
	# Unselect team
	if is_selected:
		is_selected = false
		panel.theme_type_variation = "SelectionUnselected"
