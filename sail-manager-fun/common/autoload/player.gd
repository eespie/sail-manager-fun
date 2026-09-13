extends Node

var teamInfo :TeamRes
var money : int


func _ready() -> void:
	_bind_events()


func _bind_events() -> void:
	EventBus.sigAddMoney.connect(_on_add_money)


func set_team_info(team_info :TeamRes) -> void:
	teamInfo = team_info
	set_money(team_info.startAmountMoney)


func  set_money(amount :int) -> void:
	money = amount
	EventBus.sigCurrentMoneyChanged.emit(money)


func _on_add_money(amount :int) -> void:
	money += amount
	EventBus.sigCurrentMoneyChanged.emit(money)
