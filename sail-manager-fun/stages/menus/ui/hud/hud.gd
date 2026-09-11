extends Control

@export var pageTitle : String = 'title'
@export var showMoney : bool = true
@export var showContinueButton : bool = true
@export var continueCallBack : Callable

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
	if showContinueButton:
		btnContinue.show()
	else:
		btnContinue.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_continue_pressed() -> void:
	if continueCallBack:
		continueCallBack.call()
