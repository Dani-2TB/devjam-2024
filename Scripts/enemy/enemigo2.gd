extends CharacterBody2D

var SPEED = 50.0
#var SPEED = 100.0
#@export var SPEED = 100.0
#const JUMP_VELOCITY = -400.0
var Jugador = null
@onready var navigation_agent_2d = get_node("NavigationAgent2D")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	var AreaD = get_node("AreaDisp")
	var resulta = AreaD.connect("body_entered", Callable(self, "_on_area_2d_body_entered"))
	Jugador = get_tree().get_nodes_in_group("Jugador")[0]
	get_node("CollisionShape2D/metalbat").play("default")
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
		get_node("CollisionShape2D/metalbat").set_scale(Vector2(1,1))
		#Input.is_action_just_pressed("Left"):
		
	elif direction > 0 and velocity.x > 0: 
		get_node("CollisionShape2D/metalbat").set_scale(Vector2(-1,1))
		
		#El velocity.x revisa si el enemigo se esta mpoviendo hacia la derecha o izquierdaa para voltearse
		
	if velocity.x !=0 and velocity.y != 0:
		get_node("CollisionShape2D/metalbat")
func _on_area_2d_body_entered(body):
	if body is Jugador:
	#detecta si el jugador entro al area2d
		SPEED = 1
		get_node("Timer").start()
		get_node("CollisionShape2D/metalbat").play("disp")

	


func _on_timer_timeout():
	SPEED = 50.0
	get_node("CollisionShape2D/metalbat").play("default")
