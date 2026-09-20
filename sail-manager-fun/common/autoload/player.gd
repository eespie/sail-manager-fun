extends Node

var team_info :TeamRes
var money : int


func _ready() -> void:
	_bind_events()


func _bind_events() -> void:
	EventBus.sigAddMoney.connect(_on_add_money)


func set_team_info(_team_info :TeamRes) -> void:
	team_info = _team_info
	set_money(team_info.start_amount_money)


func  set_money(amount :int) -> void:
	money = amount
	EventBus.sigCurrentMoneyChanged.emit(money)


func _on_add_money(amount :int) -> void:
	money += amount
	EventBus.sigCurrentMoneyChanged.emit(money)
