extends Node

var current_scene: Node
var scene_data: Dictionary = {}

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )
	_bind_events()


func _bind_events() -> void:
	EventBus.sigChangeScene.connect(_on_change_scene, CONNECT_DEFERRED)


func _on_change_scene(path: String) -> void:
	print(str("Scene changed to: [", path, "]"))
	var s = load(path)
	if s == null:
		return
	current_scene.queue_free()
	# Use scene_data here
	current_scene = s.instantiate()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene( current_scene )


func cleanup_group(group_name):
	var nodes = get_tree().get_nodes_in_group(group_name)
	for node in nodes:
		node.queue_free()


func set_scene_data(_scene_data : Dictionary) -> void :
	scene_data = _scene_data


func add_scene_data(_key : String, _value) -> void:
	scene_data[_key] = _value

func reset_scene_data() -> void :
	scene_data = {}


func get_scene_data() -> Dictionary:
	return scene_data
