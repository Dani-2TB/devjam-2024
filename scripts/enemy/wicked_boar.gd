extends CharacterBody2D
@export var vida: Node2D
@export var damage: Area2D
@export var hitbox: Area2D
@export var muerte: Node

const SPEED = 10
const JUMP_VELOCITY = -400.0
var Jugador = null
var attacking:bool =false
var timer_attack:Timer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	Jugador = get_tree().get_nodes_in_group("Jugador")[0]
	timer_attack = get_node("can_attack")
	timer_attack.timeout.connect(_on_timer_timeout)
func _process(delta: float) -> void:
	gameover(vida.vida_player)
	
func seguir():
	if Jugador != null:
		velocity = position.direction_to(Jugador.position) * SPEED
		#Reemplaza el null de la variable jugador 

func _physics_process(delta):
	# Add the gravity.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction < 0 and velocity.x < 0:
		get_node("Sprite2D").set_scale(Vector2(1,1))
		damage.get_child(0).position.x = -18
		#Input.is_action_just_pressed("Left"):
		
	elif direction > 0 and velocity.x > 0: 
		get_node("Sprite2D").set_scale(Vector2(-1,1))
		damage.get_child(0).position.x = 18 
		
		#El velocity.x revisa si el enemigo se esta mpoviendo hacia la derecha o izquierdaa para voltearse
		
	if velocity.x !=0 and velocity.y != 0:
		get_node("Sprite2D")
	if can_attack_player() and not attacking:
		velocity = Vector2.ZERO
		attacking=true
		timer_attack.start()
	else:
		seguir()
	if attacking:
		if timer_attack.time_left <0.2 and timer_attack.time_left >0.15 :
			damage.get_child(0).disabled = false
	move_and_slide()
	
func gameover(hp):
	if hp<=0: queue_free()

func _on_timer_timeout():
	attacking= false
	damage.get_child(0).disabled = true
	
func can_attack_player():
	var raycast= get_node("RayCast2D")
	var collider = raycast.get_collider()
	if collider == null: return false
	if collider.is_in_group("damage"): return false
	if raycast.is_colliding(): return true
	return false
	
