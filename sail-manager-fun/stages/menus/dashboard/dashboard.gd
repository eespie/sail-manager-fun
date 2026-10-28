extends Control


func _ready() -> void:
	GameSave.save_game()


func _on_options_pressed() -> void:
	EventBus.sigChangeScene.emit("uid://b23msop8e0o2u")
