extends Node2D
class_name Generador

@onready var escena_enemigo = load("res://Scenes/enemigo.tscn")
var buleano_generador = true
# Called when the node enters the scene tree for the first time.
var random = RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn()

func spawn():
	if buleano_generador:
		get_node("contador").start()
		buleano_generador = false
		var instancia_enem = escena_enemigo.instantiate()
		instancia_enem.position = Vector2(random.randi_range(-218,401),random.randi_range(14,345))
		add_child(instancia_enem)

func _on_contador_timeout() -> void:
	buleano_generador = true
