extends Control

@export var newGameScene : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_new_game_pressed() -> void:
	CrewManagement.load_initial_crew()
	EventBus.sigChangeScene.emit(newGameScene)


func _on_saved_games_item_selected(index: int) -> void:
	print(str("item_selected: ", index, " TODO -> Load saved game"))
