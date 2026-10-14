extends Control

@onready var display_option_button: OptionButton = %DisplayOptionButton

func _ready() -> void:
	if Options.fullscreen:
		display_option_button.select(1)
	else:
		display_option_button.select(0)




func _on_display_option_button_item_selected(index: int) -> void:
	if index == 0:
		Options.fullscreen = false
	else:
		Options.fullscreen = true
	Options.apply()
	GameSave.save_game('current')
