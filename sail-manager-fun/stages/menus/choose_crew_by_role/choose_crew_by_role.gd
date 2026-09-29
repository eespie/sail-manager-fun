extends Control

@onready var hud_dasboard: Control = %HUDDasboard
@onready var v_box_container: VBoxContainer = %VBoxContainer

var crew_id : int
var crew_role : String

const CREW_LINE = preload("uid://ce66bs5qwknwh")

func _ready() -> void:
	var scene_data = Scene.get_scene_data()
	crew_id = scene_data["crew_id"]
	crew_role = scene_data["crew_role"]
	hud_dasboard.set_title(str("Recruit ", crew_role))
	init_table(crew_id, crew_role)


func init_table(_crew_id, crew_role) -> void:
	var crew_by_role = CrewManagement.crew_by_role[crew_role]
	crew_by_role.sort_custom(func(a, b): return a['SKILLS'] > b['SKILLS'])
	Utils.clear_all_children(v_box_container)
	for person in crew_by_role:
		var line = CREW_LINE.instantiate()
		v_box_container.add_child(line)
		line.init(person)
