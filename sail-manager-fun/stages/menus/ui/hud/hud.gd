extends Control

@export var pageTitle : String = 'title'
@export var showMoney : bool = true
@export var showContinueButton : bool = true
@export var nextScene : String

@onready var labelTitle: Label = %Title
@onready var btnContinue: Button = %Continue
@onready var money: HBoxContainer = %Money

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelTitle.text = pageTitle
	if showMoney:
		money.show()
	else:
		money.hide()
	show_continue_button(showContinueButton)

func show_continue_button(_show : bool):
	if _show:
		btnContinue.show()
	else:
		btnContinue.hide()
		
# continue to next screen
func _on_continue_pressed() -> void:
	EventBus.sigChangeScene.emit(nextScene)
