extends Node

func save_game(_dir : String = "") -> void:
	var root : String
	if _dir.length() > 0:
		root = str("user://", _dir)
	else:
		var date = Time.get_datetime_string_from_system()
		root = str("user://", date)
	DirAccess.make_dir_absolute(root)
	
	# Options
	var path = str(root, "/options.json")
	Options.save_data(path)
	
	# Crew Management
	path = str(root, "/available_crew.json")
	CrewManagement.save_crew(path)
	
	# Player
	path = str(root, "/player.json")
	Player.save_player(path)
	
	# Teams
	path = str(root, "/teams.json")
	Teams.save_teams(path)


func load_game(date : String) -> void:
	var root = str("user://", date)
	
	# Options
	var path = str(root, "/options.json")
	Options.load_data(path)
	
	# Crew Management
	path = str(root, "/available_crew.json")
	CrewManagement.load_crew(path)
	
	# Player
	path = str(root, "/player.json")
	Player.load_player(path)
	
	# Teams
	path = str(root, "/teams.json")
	Teams.load_teams(path)
