extends CharacterBody2D

var h_movespeed = 10000 #velocidad de movimiento horizontal
var v_movespeed = 7500 #velocidad de movimiento vertical, mas baja que la horizontal para dar efecto 3D

func _physics_process(delta): 
	###Movimiento del jugador
	if Input.is_action_pressed("Left"):
		velocity.x = -h_movespeed*delta
	elif Input.is_action_pressed("Right"):
		velocity.x = h_movespeed*delta
	else:
		velocity.x = 0
	if Input.is_action_pressed("Up"):
		velocity.y = -v_movespeed*delta
	elif Input.is_action_pressed("Down"):
		velocity.y = v_movespeed*delta
	else:
		velocity.y = 0 
	###Normalizar las diagonales
	if Input.is_action_pressed("Up") and Input.is_action_pressed("Left"):
		velocity = velocity.limit_length(7000)
	if Input.is_action_pressed("Up") and Input.is_action_pressed("Right"):
		velocity = velocity.limit_length(7000)
	if Input.is_action_pressed("Down") and Input.is_action_pressed("Left"):
		velocity = velocity.limit_length(7000)
	if Input.is_action_pressed("Down") and Input.is_action_pressed("Right"):
		velocity = velocity.limit_length(7000)
	move_and_slide()
