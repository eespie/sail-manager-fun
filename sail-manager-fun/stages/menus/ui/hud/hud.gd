extends Control

@export var pageTitle : String = 'title'
@export var showMoney : bool = true
@export var showContinueButton : bool = true
@export var nextScene : String

@onready var labelTitle: Label = %Title
@onready var btnContinue: Button = %Continue
@onready var amount: Label = %Amount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_bind_events()
	labelTitle.text = pageTitle
	_on_money_changed(Player.money)
	if showMoney:
		amount.show()
	else:
		amount.hide()
	show_continue_button(showContinueButton)


func _bind_events() -> void:
	EventBus.sigCurrentMoneyChanged.connect(_on_money_changed)
	

func show_continue_button(_show : bool) -> void:
	if _show:
		btnContinue.show()
	else:
		btnContinue.hide()


# continue to next screen
func _on_continue_pressed() -> void:
	EventBus.sigChangeScene.emit(nextScene)


func _on_money_changed(_amount :int) -> void:
	var str_amount = ""
	if _amount == 0:
		str_amount = "0"
	while _amount > 0:
		var part = _amount % 1000
		_amount = (_amount - part) / 1000
		var str_part
		if _amount > 0:
			str_part = ",%03d" % part
		else:
			str_part = "%d" % part
		str_amount = str_part + str_amount
	amount.text = str("$ ", str_amount)
