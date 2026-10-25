extends Resource
class_name SeasonRes

@export var season_number : int
@export var season_prices : Array[int]
@export var season_teams : Array[TeamRes]
@export var season_events : Array[EventRes]
@export var season_race_points : Dictionary[Constant.RACE_TYPE, Array]
@export var season_event_points : Array[int]
@export var season_map : Resource
