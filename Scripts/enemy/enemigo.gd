extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var Jugador = null
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	Jugador = get_tree().get_nodes_in_group("Jugador")[0]
func _process(delta: float) -> void:
	seguir()
	
func seguir():
	if Jugador != null:
		velocity = position.direction_to(Jugador.position) * SPEED
		#Reemplaza el null de la variable jugador 
		move_and_slide()
func _physics_process(delta):
	# Add the gravity.

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction < 0 and velocity.x < 0:
		get_node("CollisionShape2D/Sprite2D").set_scale(Vector2(1,1))
		#Input.is_action_just_pressed("Left"):
		
	elif direction > 0 and velocity.x > 0: 
		get_node("CollisionShape2D/Sprite2D").set_scale(Vector2(-1,1))
		
		#El velocity.x revisa si el enemigo se esta mpoviendo hacia la derecha o izquierdaa para voltearse
		
	if velocity.x !=0 and velocity.y != 0:
		get_node("CollisionShape2D/Sprite2D")

	
	
	
