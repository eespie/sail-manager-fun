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
	crew[_crew_id] = PersonEntity.create_from_person(_person)
	add_money(-crew[_crew_id].person_annual_salary)


func add_money(_amount : int) -> void:
	set_money(current_money + _amount)


func set_money(_amount : int) -> void:
	current_money = _amount
	EventBus.sigCurrentMoneyChanged.emit(team_id, current_money)
