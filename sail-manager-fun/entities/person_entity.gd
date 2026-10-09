extends Object
class_name PersonEntity

var person_name : String
var person_nationality : String
var person_annual_salary : int
var person_role : String
var person_remaining_years : int
var person_endurance : int
var person_experience : int
var person_skills : int
var person_learning_skills : int


static func _from_dictionary(data : Dictionary) -> PersonEntity:
	var entity = PersonEntity.new()
	entity.person_name = data["NAME"]
	entity.person_nationality = data["NATIONALITY"]
	entity.person_annual_salary = data["ANNUAL_SALARY"]
	entity.person_role = data["ROLE"]
	entity.person_remaining_years = data["REMAINING_YEARS"]
	entity.person_endurance = data["ENDURANCE"]
	entity.person_experience = data["EXPERIENCE"]
	entity.person_skills = data["SKILLS"]
	entity.person_learning_skills = data["LEARNING"]
	return entity

func _to_dictionary() -> Dictionary:
	var data : Dictionary = {}
	data["NAME"] = person_name
	data["NATIONALITY"] = person_nationality
	data["ANNUAL_SALARY"] = person_annual_salary
	data["ROLE"] = person_role
	data["REMAINING_YEARS"] = person_remaining_years
	data["ENDURANCE"] = person_endurance
	data["EXPERIENCE"] = person_experience
	data["SKILLS"] = person_skills
	data["LEARNING"] = person_learning_skills
	return data
