extends Control

@export var newGameScene : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_new_game_pressed() -> void:
	print("New game")
	EventBus.sigChangeScene.emit(newGameScene)


func _on_saved_games_item_activated(index: int) -> void:
	print(str("item_activated: ", index))


func _on_saved_games_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	print(str("item_clicked: ", index, " - at_position: ", at_position, " - mouse_button_index: ", mouse_button_index))


func _on_saved_games_item_selected(index: int) -> void:
	print(str("item_selected: ", index))
