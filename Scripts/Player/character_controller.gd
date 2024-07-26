extends CharacterBody2D

@export var h_movespeed: int = 200 #velocidad de movimiento horizontal
@export var v_movespeed: int = 150 #velocidad de movimiento vertical, mas baja que la horizontal para dar efecto 3D
var input: Vector2 = Vector2.ZERO

func _physics_process(delta): 
	input = Input.get_vector("Left", "Right", "Up", "Down")
	if Input.is_action_just_pressed("Left"):
		$Sprite2D.set_scale(Vector2(-1,1))
		#$Sprite2D.set_scale(Vector2(20,20)) d	
		
		#$Sprite2D.set_rotation_degrees(270)
		
	elif Input.is_action_just_pressed("Right") :
		$Sprite2D.set_scale(Vector2(1,1))
		#$Sprite2D.set_rotation_degrees(-270)
		
	velocity.x = input.x * h_movespeed
	velocity.y = input.y * v_movespeed
	if Input.is_action_just_pressed("Space"):
		$CollisionShape2D. set_debug_color( Color(242, 0,144,255)) 
		$Sprite2D.set_scale(Vector2(-1,1))

	move_and_slide()
