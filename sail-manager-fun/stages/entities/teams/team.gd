extends Control
class_name TeamChooser

@export var teamInfo : TeamRes

@onready var boat: TextureRect = %Boat
@onready var amount: Label = %Amount
@onready var team_name: Label = %TeamName

var tween : Tween

func _ready() -> void:
	boat.texture = teamInfo.chooserImage
	team_name.text = teamInfo.team_name
	amount.text = str("$ ", teamInfo.startAmountMoney)


func _on_mouse_entered() -> void:
	if tween and tween.is_running():
		tween.kill()
	self.z_index = 1
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)
	tween.tween_property(self, "offset_transform_scale:x", 1.15, 0.15)
	tween.tween_property(self, "offset_transform_scale:y", 1.15, 0.15)


func _on_mouse_exited() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)
	tween.tween_property(self, "offset_transform_scale", Vector2.ONE, 0.15)
	self.z_index = 0

func _on_gui_input(_event: InputEvent) -> void:
	pass # Replace with function body.
