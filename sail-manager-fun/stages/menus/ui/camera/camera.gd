extends Camera2D

var pan_factor : float = 10.0
var zoom_min : float = 0.09
var zoom_delta : float = 0.05


@export var map_size : Vector2 = Vector2(1920, 1080)

var action_state = 'idle'
var action_pos

func _ready():
	zoom_min = max(float(Options.WIDTH) / float(map_size.x), float(Options.HEIGHT) / float(map_size.y))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	adjust_camera()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and action_state == 'panning':
		position += (action_pos - event.position) / (pan_factor * zoom.x)
		
	if event.is_action_pressed("camera_pan"):
		action_pos = event.position
		action_state = 'panning'
	
	if event.is_action_released("camera_pan"):
		action_state = 'idle'

	if event.is_action_pressed("camera_zoom_in"):
		zoom *= 1.0 + zoom_delta
		
	if event.is_action_pressed("camera_zoom_out"):
		zoom *= 1.0 - zoom_delta



func adjust_camera() -> void:
	if zoom.x < zoom_min:
		zoom = Vector2(zoom_min, zoom_min)
	
	var camera_rect = get_camera_rect()
	
	if camera_rect.position.x < 0:
		position.x -= camera_rect.position.x
	if camera_rect.position.y < 0:
		position.y -= camera_rect.position.y
	if camera_rect.position.x + camera_rect.size.x > map_size.x:
		position.x -= camera_rect.position.x + camera_rect.size.x - map_size.x
	if camera_rect.position.y + camera_rect.size.y > map_size.y:
		position.y -= camera_rect.position.y + camera_rect.size.y - map_size.y


func get_camera_rect() -> Rect2:
	var camera_rect = get_viewport_rect() * get_canvas_transform()
	
	var factor : float = zoom.x * zoom.x
	camera_rect.size.x /= factor
	camera_rect.position.x /= factor
	
	camera_rect.size.y /= factor
	camera_rect.position.y /= factor
	
	return camera_rect
