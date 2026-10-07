extends Control

@onready var hud_dasboard: Control = %HUDDasboard
@onready var v_box_container: VBoxContainer = %VBoxContainer

var crew_id : int
var crew_role : String
var selected_person : Dictionary

const CREW_LINE = preload("uid://ce66bs5qwknwh")

func _ready() -> void:
	var scene_data = Scene.get_scene_data()
	crew_id = scene_data["crew_id"]
	crew_role = scene_data["crew_role"]
	hud_dasboard.set_title(str("Recruit ", crew_role))
	init_table(crew_id, crew_role)
	hud_dasboard.show_continue_button(false)
	_bind_events()


func _bind_events() -> void:
	EventBus.sigCrewLineSelected.connect(_on_crew_line_selected)
	EventBus.sigPrepareContinue.connect(_on_prepare_continue)


func init_table(_crew_id, _crew_role) -> void:
	var crew_by_role = CrewManagement.crew_by_role[_crew_role]
	var max_salary = Teams.teams[Player.team_id].current_money
	crew_by_role.sort_custom(func(a, b): return a['SKILLS'] > b['SKILLS'])
	Utils.clear_all_children(v_box_container)
	for person in crew_by_role:
		if int(person['TEAM']) != 0 or person['ANNUAL_SALARY'] > max_salary:
			continue
		var line = CREW_LINE.instantiate()
		v_box_container.add_child(line)
		line.init(crew_id, person)


func _on_crew_line_selected(_person : Dictionary) -> void:
	selected_person = _person
	hud_dasboard.show_continue_button(true)


func _on_prepare_continue() -> void:
	EventBus.sigCrewHired.emit(Player.team_id, crew_id, selected_person)
