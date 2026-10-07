extends Control

@export var pageTitle : String = 'title'
@export var showMoney : bool = true
@export var showContinueButton : bool = true
@export var nextScene : String

@onready var labelTitle: Label = %Title
@onready var btnContinue: Button = %Continue
@onready var amount: Label = %Amount
@onready var team: Label = %Team

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_bind_events()
	labelTitle.text = pageTitle
	if Player.team_id:
		var team_entity : TeamEntity = Teams.teams[Player.team_id]
		team.text = str("Team ", team_entity.team_res.team_full_name)
		_on_money_changed(Player.team_id, team_entity.current_money)
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
	EventBus.sigPrepareContinue.emit()
	EventBus.sigChangeScene.emit(nextScene)


func _on_money_changed(_team_id : int, _amount :int) -> void:
	if Player.team_id != _team_id:
		return
	amount.text = Utils.format_money(_amount)


func set_title(_title : String) -> void:
	pageTitle = _title
	labelTitle.text = pageTitle
