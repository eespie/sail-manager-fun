extends HBoxContainer

@onready var name_label: Label = %NameLabel
@onready var nation_label: Label = %NationLabel
@onready var career_label: Label = %CareerLabel
@onready var exp_label: TextureRect = %ExpLabel
@onready var skills_label: TextureRect = %SkillsLabel
@onready var endurance_label: TextureRect = %EnduranceLabel
@onready var salary_label: Label = %SalaryLabel

const LEVELS : Array = [
	preload("uid://dysot830ivr00"),
	preload("uid://bglvkwhpk4q3"),
	preload("uid://ot64gmg33642"),
	preload("uid://gq8okseiuekr"),
	preload("uid://bde3f6unpmu2b")
]

func init(person : Dictionary) -> void:
	name_label.text = person['NAME']
	nation_label.text = person['NATIONALITY']
	career_label.text = _format_career(person['REMAINING_YEARS'])
	salary_label.text = str(Utils.format_money(person['ANNUAL_SALARY']), " ")
	exp_label.texture = get_stars_from_level(person['EXPERIENCE'])
	skills_label.texture = get_stars_from_level(person['SKILLS'])
	endurance_label.texture = get_stars_from_level(person['ENDURANCE'])


func get_stars_from_level(level : int) -> Resource:
	var star = floori((level - 50) / 10.0)
	if star < 0:
		star = 0
	if star > 4:
		star = 4
	return LEVELS[star]

func _format_career(remaining_years: int) -> String:
	if remaining_years < 5:
		return "Start"
	if remaining_years < 10:
		return "Mid"
	return "End"
