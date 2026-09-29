extends Node
class_name TeamEntity

@export var team_res : TeamRes
@export var crew : Array[PersonEntity]

var uuid : int
var current_money : int


func _ready() -> void:
	_bind_events()


func _bind_events() -> void:
	EventBus.sigAddMoney.connect(_on_add_money)


func _on_add_money(_id : int, _amount :int) -> void:
	if _id == uuid:
		var money = current_money + _amount
		set_money(money)


func set_money(_amount : int) -> void:
	current_money = _amount
	EventBus.sigCurrentMoneyChanged.emit(uuid, current_money)


func set_team_resource(_team_res :TeamRes) -> void:
	team_res = _team_res
	set_money(team_res.start_amount_money)
