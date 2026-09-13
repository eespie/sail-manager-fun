extends Control

@export var nextScene : String

func _ready() -> void:
	EventBus.sigChangeScene.emit(nextScene)
