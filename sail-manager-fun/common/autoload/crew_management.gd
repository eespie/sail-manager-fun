extends Node

const initial_crew_file = "res://assets/data/crew-data.json"
const crew_file = "user://crew-data.json"

var crew_by_role : Dictionary
var role_resources : Dictionary

func _ready() -> void:
	load_crew()

func load_initial_crew() -> void :
	for role in Constant.CREW_ROLE.keys():
		crew_by_role[role.capitalize()] = Array()
		role_resources[role.capitalize()] = load(str("res://resources/roles/role_", role.to_lower(), ".tres"))
	var initial_crew : Array = File.load_data(initial_crew_file)
	for i in range(initial_crew.size()):
		var person = initial_crew[i]
		var role = person['ROLE'].capitalize()
		var person_res = role_resources[role]
		person['REMAINING_YEARS'] = randi() % 15 + 2
		person['EXPERIENCE'] = randi() % 50 + 50
		person['SKILLS'] = randi() % 50 + 50
		person['ENDURANCE'] = randi() % 50 + 50
		person['ANNUAL_SALARY'] = floori((randi() % (person_res.annual_salary_max - person_res.annual_salary_min) + person_res.annual_salary_min) / 1000.0) * 1000
		crew_by_role[role].append(person)
	save_crew()

func load_crew() -> void :
	crew_by_role = File.load_data(crew_file)
	if crew_by_role == {}:
		load_initial_crew()


func save_crew() -> void:
	File.save_data(crew_by_role, crew_file)
