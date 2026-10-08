extends Control

@onready var crew: Panel = %Crew
@onready var crew_name: Label = %"Crew Name"
@onready var crew_nationality: Label = %"Crew Nationality"
@onready var crew_salary: Label = %"Crew Salary"
@onready var crew_type_label: Label = %CrewTypeLabel

@export var crew_role : CrewRole
@export var crew_id : int
@export var is_mandatory : bool = true

var person
var tween: Tween
var mousePressed: bool = false
var mouseEntered: bool = false


func _ready() -> void:
	crew_type_label.text = crew_role.role_name
	offset_transform_enabled = true
	_bind_events()


func _bind_events() -> void:
	EventBus.sigCrewHired.connect(_on_crew_hired)


func init_from_person_entity(_person_entity : PersonEntity) -> void:
	crew_name.text = _person_entity.person_name
	crew_nationality.text = _person_entity.person_nationality
	crew_salary.text = Utils.format_money(_person_entity.person_annual_salary)
	crew_type_label.offset_transform_rotation = 0
	crew_name.show()
	crew_nationality.show()
	crew_salary.show()
	crew.self_modulate = Color.AQUA


func _on_crew_hired(_crew_id :int, _person : Dictionary) -> void:
	if crew_id != _crew_id:
		return
	person = _person
	crew_name.text = person['NAME']
	crew_nationality.text = person['NATIONALITY']
	crew_salary.text = Utils.format_money(floori(person['ANNUAL_SALARY']))
	crew_type_label.offset_transform_rotation = 0
	crew_name.show()
	crew_nationality.show()
	crew_salary.show()
	crew.self_modulate = Color.AQUA


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
				Scene.add_scene_data("crew_id", crew_id)
				Scene.add_scene_data("crew_role", crew_role.role_name)
				EventBus.sigChangeScene.emit("uid://c6psfmyaba2lk")
				EventBus.sigCrewSelectionNeeded.emit(crew_id, crew_role)
			mousePressed = event.pressed
