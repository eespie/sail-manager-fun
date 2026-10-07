extends Object
class_name PersonEntity

var person_name : String
var person_nationality : String
var person_annual_salary : int
var person_role : Constant.CREW_ROLE
var person_remaining_years : int
var person_endurance : int
var person_experience : int
var person_skills : int
var person_learning_skills : int


static func create_from_person(_person : Dictionary) -> PersonEntity:
	var entity = PersonEntity.new()
	entity.person_name = _person["NAME"]
	entity.person_nationality = _person["NATIONALITY"]
	entity.person_annual_salary = _person["ANNUAL_SALARY"]
	entity.person_role = _person["ROLE"]
	entity.person_remaining_years = _person["REMAINING_YEARS"]
	entity.person_endurance = _person["ENDURANCE"]
	entity.person_experience = _person["EXPERIENCE"]
	entity.person_skills = _person["SKILLS"]
	entity.person_learning_skills = _person["EXPERIENCE"]
	return entity
