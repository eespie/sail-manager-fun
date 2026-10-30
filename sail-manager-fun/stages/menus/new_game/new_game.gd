extends Control

@export var newGameScene : String
@onready var saved_games: ItemList = %"Saved Games"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Display previously saved games
	GameSave.load_games()
	for game_date in GameSave.games:
		if DirAccess.dir_exists_absolute(str(GameSave.root_dir, game_date)):
			saved_games.add_item(game_date)
		else:
			GameSave.games.erase(game_date)


func _on_new_game_pressed() -> void:
	CrewManagement.load_initial_crew()
	GameSave.new_game()
	EventBus.sigChangeScene.emit(newGameScene)


func _on_saved_games_item_selected(index: int) -> void:
	print(str("item_selected: ", index, " TODO -> Load saved game"))
	GameSave.current_game = GameSave.games[index]
	# Save current game
	GameSave.save_games()
	# Load all data
	GameSave.load_game()
	# Go to dashboard
	EventBus.sigChangeScene.emit("uid://b275r5u4p0iex")


func _on_quit_pressed() -> void:
	get_tree().quit()
