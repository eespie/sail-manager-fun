extends Node
#class_name GameSave

var root_dir : String = 'user://games/'
var games_path : String
var games : Array = []
var current_game : String


func _ready() -> void:
	DirAccess.make_dir_absolute(root_dir)
	games_path = str(root_dir, "games.json")

func save_game() -> void:
	var root : String = str(root_dir, current_game)
	DirAccess.make_dir_absolute(root)
	# Crew Management
	var path : String = str(root, "/available_crew.json")
	CrewManagement.save_crew(path)
	# Player
	path = str(root, "/player.json")
	Player.save_player(path)
	# Teams
	path = str(root, "/teams.json")
	Teams.save_teams(path)
	# Career
	path = str(root, "/career.json")
	Career.save_career(path)
	# saved games
	save_games()


func load_game() -> void:
	var root : String = str(root_dir, current_game)
	# Crew Management
	var path : String = str(root, "/available_crew.json")
	CrewManagement.load_crew(path)
	# Player
	path = str(root, "/player.json")
	Player.load_player(path)
	# Teams
	path = str(root, "/teams.json")
	Teams.load_teams(path)
	# Career
	path = str(root, "/career.json")
	Career.load_career(path)


func _from_dictionary(_data : Dictionary) -> void:
	games = []
	for i in _data:
		if i == 'current_game':
			current_game = _data[i]
		else:
			games.append(_data[i])


func _to_dictionary() -> Dictionary:
	var data : Dictionary = {}
	var i : int = 0
	for game_date in games:
		data[i] = game_date
		i += 1
	data['current_game'] = current_game
	return data


func load_games() -> void:
	_from_dictionary(File.load_data(games_path))
	# Options
	var path = str(root_dir, "/options.json")
	Options.load_data(path)

func save_games() -> void:
	File.save_data(_to_dictionary(), games_path)
	# Options
	var path = str(root_dir, "/options.json")
	Options.save_data(path)

func new_game() -> void:
	var date = Time.get_datetime_string_from_system()
	games.insert(0, date)
	current_game = date
