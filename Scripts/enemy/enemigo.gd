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
		
		move_and_slide()
func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction < 0 and velocity.x < 0:
		$CollisionShape2D/Sprite2D.set_scale(Vector2(1,1))
		#Input.is_action_just_pressed("Left"):
		
	elif direction > 0 and velocity.x > 0: 
		$CollisionShape2D/Sprite2D.set_scale(Vector2(-1,1))

	
