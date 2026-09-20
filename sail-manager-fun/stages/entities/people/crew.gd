extends Control

@onready var crew: Panel = %Crew
@onready var crew_name: Label = %"Crew Name"
@onready var crew_nationality: Label = %"Crew Nationality"
@onready var crew_salary: Label = %"Crew Salary"
@onready var crew_type_label: Label = %CrewTypeLabel

@export var crew_type : Constant.CREW_TYPE;
@export var crew_id : int

var tween: Tween
var mousePressed: bool = false
var mouseEntered: bool = false


func _ready() -> void:
	crew_type_label.text = Constant.CREW_TYPE.keys()[crew_type].capitalize()
	offset_transform_enabled = true


func set_people():
	crew.self_modulate = Color.CORNFLOWER_BLUE


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
				EventBus.sigCrewSelected.emit(crew_id)
			mousePressed = event.pressed
