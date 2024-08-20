extends Node2D
class_name Level

@export var level_id: int
@export var number_of_screens: int = 1
var current_screen: int = 1
var screen_instance: Node2D
var reloading: bool = false

func _ready():
	screen_instance = load_screen()
	add_child(screen_instance)
	set_player_spawn()

func _process(delta):
	if reloading:
		change_screen()
		reloading = false

func change_screen():
	screen_instance.queue_free()
	screen_instance = load_screen()
	add_child(screen_instance)
	set_player_spawn()
	
func set_player_spawn():
	var spawn_point = screen_instance.get_node("PlayerSpawn")
	var parent = get_parent()
	parent.set_player_position(spawn_point.position.x, spawn_point.position.y)

func load_screen():
	var screen_path: String = "res://scenes/levels/level_{}/pantallas/level_{}_{}.tscn".format([level_id, level_id, current_screen], "{}")
	print("loading file:  ", screen_path)
	var screen_scene: PackedScene = load(screen_path)
	if screen_scene == null:
		print("screen did not load")
		return null
	
	return screen_scene.instantiate()
