extends Object
class_name TeamEntity

var team_res : TeamRes
var crew : Dictionary[int, PersonEntity]
var team_id : int
var current_money : int


func set_team_resource(_team_res :TeamRes) -> void:
	team_res = _team_res
	team_id = team_res.team_id
	set_money(team_res.start_amount_money)


func crew_hired(_crew_id :int, _person : Dictionary) -> void:
	if crew.has(_crew_id):
		add_money(crew[_crew_id].person_annual_salary)
	crew[_crew_id] = PersonEntity._from_dictionary(_person)
	add_money(-crew[_crew_id].person_annual_salary)


func add_money(_amount : int) -> void:
	set_money(current_money + _amount)


func set_money(_amount : int) -> void:
	current_money = _amount
	EventBus.sigCurrentMoneyChanged.emit(team_id, current_money)


static func _from_dictionary(data : Dictionary) -> TeamEntity:
	var entity = TeamEntity.new()
	entity.team_id = data["team_id"]
	entity.current_money = data["current_money"]
	entity.team_res = ResourceLoader.load(str("res://resources/team/team_",data['team_name'].to_lower(),".tres"))
	var data_crew : Dictionary = data["crew"]
	for crew_id in data_crew.keys():
		entity.crew[int(crew_id)] = PersonEntity._from_dictionary(data_crew[crew_id])
	return entity


func _to_dictionary() -> Dictionary:
	var data : Dictionary = {}
	data["team_id"] = team_id
	data["current_money"] = current_money
	data['team_name'] = team_res.team_name
	var data_crew : Dictionary = {}
	for crew_id in crew.keys():
		data_crew[crew_id] = crew[crew_id]._to_dictionary()
	data["crew"] = data_crew
	return data
