extends Control

@onready var crew: Panel = %Crew
@onready var crew_name: Label = %"Crew Name"
@onready var crew_nationality: Label = %"Crew Nationality"
@onready var crew_salary: Label = %"Crew Salary"
@onready var crew_type_label: Label = %CrewTypeLabel
@onready var crew_flag: TextureRect = %Flag
@onready var person_info_container: VBoxContainer = %PersonInfo
@onready var person_select_button: Button = %"Person Select"
@onready var skill_level_dots: TextureRect = %"Skill Level"
@onready var exp_level_dots: TextureRect = %"Exp Level"
@onready var endurance_level_dots: TextureRect = %"Endurance Level"

@export var crew_role : CrewRole
@export var crew_id : int
@export var is_mandatory : bool = true

const LEVELS : Array = [
	preload('uid://drsmv7kbcwgem'),
	preload('uid://dak3p38x0tntl'),
	preload('uid://crbtrxrrswe8r'),
	preload('uid://38v1n30h8io2'),
	preload('uid://c2g77imu85n55'),
	preload('uid://2yyvi5mrr3dm'),
	preload('uid://c21wbwo1rog73'),
	preload('uid://dq5o7ri2c2iu'),
	preload('uid://d0j1tf4y51150'),
	preload('uid://cpfwxb6yhi03y'),
]


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
	skill_level_dots.texture = get_level(_person_entity.person_skills)
	exp_level_dots.texture = get_level(_person_entity.person_experience)
	endurance_level_dots.texture = get_level(_person_entity.person_endurance)
	person_info_container.show()
	person_select_button.text = "> Change"
	crew.theme_type_variation = "SelectionSelected"


func get_level(level : int) -> Resource:
	var dot = floori(level / 10.0)
	if dot < 0:
		dot = 0
	if dot > 9:
		dot = 9
	return LEVELS[dot]


func crew_selection_needed() -> void:
	Scene.add_scene_data("crew_id", crew_id)
	Scene.add_scene_data("crew_role", crew_role.role_name)
	EventBus.sigChangeScene.emit("uid://c6psfmyaba2lk")
	EventBus.sigCrewSelectionNeeded.emit(crew_id, crew_role)


func _on_person_select_pressed() -> void:
	crew_selection_needed()
