extends PanelContainer

@onready var season_name: Label = %"Season Name"
@onready var event_title: Label = %"Event Title"
@onready var event_location: Label = %Location
@onready var event_nationality: Label = %Nationality
@onready var event_flag: TextureRect = %Flag
@onready var race_number: Label = %"Race Number"
@onready var event_map: TextureRect = %"Event Map"


func _ready() -> void:
	season_name.text = str(Career.season_res.season_number)
	event_title.text = "Event %d" % Career.event_res.event_number
	event_location.text = Career.event_res.event_location.location_name
	event_nationality.text = Career.event_res.event_location.location_country
	event_flag.texture = Career.event_res.event_location.location_flag
	race_number.text = str(Career.next_event['race'])
	event_map.texture = Career.event_res.event_location.location_map
