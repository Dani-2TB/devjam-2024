extends Node
class_name LevelManager

@export var current_level: int = 1
@export var max_levels: int = 1
@export var player: CharacterController

var level: Node
var reloading: bool = false

func _ready():
	# Init Level
	level = load_level()
	print(player.position.x)
	add_child(level)

func _process(delta):
	if reloading:
		change_scene()
		reloading = false
	if Input.is_action_just_pressed("reset"):
		get_child(0).vida.vida_player = 10
		change_scene()

func change_scene():
	level.queue_free()
	level = load_level()
	add_child(level)
	get_child(0).visible = true

func load_level():
	var level_scene: PackedScene
	var level_path: String = "res://scenes/levels/level_{}/level_{}.tscn".format([current_level, current_level], "{}")
	level_scene = load(level_path)
	if level_scene == null:
		return null
		# TODO: Cargar una escena por defecto.
	var level_instance = level_scene.instantiate()
	return level_instance

func set_player_position(x:int, y:int):
	player.position.x = x
	player.position.y = y
	
	
