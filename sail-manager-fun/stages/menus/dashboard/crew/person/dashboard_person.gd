extends Control

@onready var person_role: Label = %Role
@onready var person_name: Label = %Name
@onready var person_status: Label = %Status


func init(_role : String, _name : String, _status) -> void:
	person_role.text = _role.capitalize()
	person_name.text = _name
