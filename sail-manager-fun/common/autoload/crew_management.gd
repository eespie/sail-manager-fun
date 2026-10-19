extends Node

const initial_crew_file = "res://assets/data/crew-data.json"

var crew_by_role : Dictionary
var role_resources : Dictionary


func _ready() -> void:
	_bind_events()


func _bind_events() -> void:
	EventBus.sigCrewHired.connect(_on_crew_hired)


func _on_crew_hired(_team_id : int, _crew_id :int, _person : Dictionary) -> void:
	var role = _person['ROLE'].capitalize()
	for i in range(crew_by_role[role].size()):
		var person = crew_by_role[role][i]
		if person['NAME'] == _person['NAME']:
			person['TEAM'] = _team_id
			crew_by_role[role][i] = person
			break


func load_initial_crew() -> void :
	for role in Constant.CREW_ROLE.keys():
		crew_by_role[role.capitalize()] = Array()
		role_resources[role.capitalize()] = load(str("res://resources/roles/role_", role.to_lower(), ".tres"))
	var initial_crew : Array = File.load_data(initial_crew_file)
	for i in range(initial_crew.size()):
		var person = initial_crew[i]
		var role = person['ROLE'].capitalize()
		var person_res = role_resources[role]
		person['REMAINING_YEARS'] = randi() % 20 + 2
		var ry_capacity : float = clamp((8.0 - (person['REMAINING_YEARS']/2.0)) / 7.0, 0.0, 1.0)
		person['ENDURANCE'] = randi() % 90
		person['LEARNING'] = randi() % 90
		var experience_capacity : int = floori(clamp((18 - person['REMAINING_YEARS']) * (person['LEARNING'] / 10.0), 30.0, 90.0)) 
		person['EXPERIENCE'] = randi() % experience_capacity
		person['SKILLS'] = randi() % 50 + floori(person['EXPERIENCE'] / 2.0)
		var capacity = (person['EXPERIENCE'] + person['SKILLS'] + person['ENDURANCE'] + person['LEARNING']) / 400.0
		person['ANNUAL_SALARY'] = floori((randi() % (person_res.annual_salary_max - person_res.annual_salary_min) * capacity * ry_capacity + person_res.annual_salary_min) / 1000.0) * 1000
		person['TEAM'] = 0
		crew_by_role[role].append(person)


func load_crew(path : String) -> void :
	crew_by_role = File.load_data(path)
	if crew_by_role == {}:
		load_initial_crew()


func save_crew(path : String) -> void:
	File.save_data(crew_by_role, path)
