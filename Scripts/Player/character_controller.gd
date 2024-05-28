extends CharacterBody2D

@export var h_movespeed: int = 200 #velocidad de movimiento horizontal
@export var v_movespeed: int = 150 #velocidad de movimiento vertical, mas baja que la horizontal para dar efecto 3D
var input: Vector2 = Vector2.ZERO

func _physics_process(delta): 
	####Movimiento del jugador
	#if Input.is_action_pressed("Left"):
		#velocity.x = -h_movespeed*delta
	#elif Input.is_action_pressed("Right"):
		#velocity.x = h_movespeed*delta
	#else:
		#velocity.x = 0
	#if Input.is_action_pressed("Up"):
		#velocity.y = -v_movespeed*delta
	#elif Input.is_action_pressed("Down"):
		#velocity.y = v_movespeed*delta
	#else:
		#velocity.y = 0
	####Normalizar las diagonales
	#if Input.is_action_pressed("Up") and Input.is_action_pressed("Left"):
		#velocity = velocity.limit_length(7000)
	#if Input.is_action_pressed("Up") and Input.is_action_pressed("Right"):
		#velocity = velocity.limit_length(7000)
	#if Input.is_action_pressed("Down") and Input.is_action_pressed("Left"):
		#velocity = velocity.limit_length(7000)
	#if Input.is_action_pressed("Down") and Input.is_action_pressed("Right"):
		#velocity = velocity.limit_length(7000)
	
	input = Input.get_vector("Left", "Right", "Up", "Down")
	
	print(input)
	
	velocity.x = input.x * h_movespeed
	velocity.y = input.y * v_movespeed
	
	move_and_slide()
