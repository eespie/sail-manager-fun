extends Control

@export var nextScene : String

func _ready() -> void:
	if DirAccess.dir_exists_absolute("user://current"):
		nextScene = "uid://b275r5u4p0iex" # dashboard
		GameSave.load_game("current")
		
	EventBus.sigChangeScene.emit(nextScene)
