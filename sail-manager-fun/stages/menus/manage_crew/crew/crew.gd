extends Control

@onready var crew: Panel = %Crew
@onready var crew_name: Label = %"Crew Name"
@onready var crew_nationality: Label = %"Crew Nationality"
@onready var crew_salary: Label = %"Crew Salary"
@onready var crew_type_label: Label = %CrewTypeLabel
@onready var crew_flag: TextureRect = %Flag
@onready var person_info_container: VBoxContainer = %PersonInfo
@onready var person_select_button: Button = %"Person Select"

@export var crew_role : CrewRole
@export var crew_id : int
@export var is_mandatory : bool = true


func _ready() -> void:
	crew_type_label.text = crew_role.role_name
	_bind_events()


func _bind_events() -> void:
	pass


func init_from_person_entity(_person_entity : PersonEntity) -> void:
	crew_name.text = _person_entity.person_name
	crew_nationality.text = _person_entity.person_nationality
	crew_salary.text = Utils.format_money(_person_entity.person_annual_salary)
	crew_type_label.offset_transform_rotation = 0
	crew_flag.texture = load(str('res://resources/flag/png-small/', Constant.FLAG_BY_COUNTRY[_person_entity.person_nationality]))
	person_info_container.show()
	person_select_button.text = "> Change"
	crew.theme_type_variation = "SelectionSelected"


func crew_selection_needed() -> void:
	Scene.add_scene_data("crew_id", crew_id)
	Scene.add_scene_data("crew_role", crew_role.role_name)
	EventBus.sigChangeScene.emit("uid://c6psfmyaba2lk")
	EventBus.sigCrewSelectionNeeded.emit(crew_id, crew_role)


func _on_person_select_pressed() -> void:
	crew_selection_needed()
