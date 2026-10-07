extends ColorRect

@onready var name_label: Label = %NameLabel
@onready var nation_label: Label = %NationLabel
@onready var career_label: Label = %CareerLabel
@onready var exp_label: TextureRect = %ExpLabel
@onready var skills_label: TextureRect = %SkillsLabel
@onready var endurance_label: TextureRect = %EnduranceLabel
@onready var salary_label: Label = %SalaryLabel

var person : Dictionary
var crew_id : int
var tween: Tween
var mousePressed: bool = false
var mouseEntered: bool = false
var is_selected: bool = false

const LEVELS : Array = [
	preload("uid://dysot830ivr00"),
	preload("uid://bglvkwhpk4q3"),
	preload("uid://ot64gmg33642"),
	preload("uid://gq8okseiuekr"),
	preload("uid://bde3f6unpmu2b")
]


func _ready() -> void:
	EventBus.sigCrewLineSelected.connect(_on_crew_selected)

func init(_crew_id : int, _person : Dictionary) -> void:
	person = _person
	crew_id = _crew_id
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


func _on_mouse_entered() -> void:
	if not is_selected:
		self_modulate = Color("8f9aff")
	mouseEntered = true
	mousePressed = false


func _on_mouse_exited() -> void:
	if not is_selected:
		self_modulate = Color("898989")
	mouseEntered = false


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and mouseEntered:
			if mousePressed and not event.pressed:
				is_selected = true
				self_modulate = Color("ffffffff")
				EventBus.sigCrewLineSelected.emit(person)
			mousePressed = event.pressed


func _on_crew_selected(_person) -> void:
	if _person['NAME'] != person['NAME']:
		is_selected = false
		self_modulate = Color("898989")
