extends Control


func _ready() -> void:
	GameSave.save_game()


func _on_options_pressed() -> void:
	EventBus.sigChangeScene.emit("uid://b23msop8e0o2u")


func _on_load_save_pressed() -> void:
	EventBus.sigChangeScene.emit("uid://ddt17xj1854p8")


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		EventBus.sigChangeScene.emit("uid://ddt17xj1854p8")
