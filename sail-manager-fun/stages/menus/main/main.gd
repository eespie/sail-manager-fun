extends Control

@export var nextScene : String

func _ready() -> void:
	GameSave.load_games()
	EventBus.sigChangeScene.emit(nextScene)
