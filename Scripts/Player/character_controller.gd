extends CharacterBody2D
class_name Jugador
#@onready var escena_jugador = load("res://Scenes/froak_frodinand.tscn")
@export var h_movespeed: int = 200 #velocidad de movimiento horizontal
@export var v_movespeed: int = 150 #velocidad de movimiento vertical, mas baja que la horizontal para dar efecto 3D
var input: Vector2 = Vector2.ZERO
func _ready():
	add_to_group("Jugador")
func _physics_process(delta): 

	input = Input.get_vector("Left", "Right", "Up", "Down")
	if Input.is_action_just_pressed("Left"):
		get_node("Sprite2D").set_scale(Vector2(-1,1))
		#$Sprite2D.set_scale(Vector2(20,20)) d	
		
		#$Sprite2D.set_rotation_degrees(270)
		
	elif Input.is_action_just_pressed("Right") :
		get_node("Sprite2D").set_scale(Vector2(1,1))
		#$Sprite2D.set_rotation_degrees(-270)
		
	velocity.x = input.x * h_movespeed
	velocity.y = input.y * v_movespeed
	if Input.is_action_just_pressed("Space"):
		get_node("Sprite2D").set_scale(Vector2(-1,1))
#func aparicion()
	move_and_slide()
