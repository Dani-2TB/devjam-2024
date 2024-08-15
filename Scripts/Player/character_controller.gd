extends CharacterBody2D
class_name Jugador
var posx = get_node(".").get_position()
#@onready var escena_jugador = load("res://Scenes/froak_frodinand.tscn")
@export var h_movespeed: int = 200 #velocidad de movimiento horizontal
@export var v_movespeed: int = 150 #velocidad de movimiento vertical, mas baja que la horizontal para dar efecto 3D
@onready var oreja = [load("res://Scenes/audio_listener_2d.tscn")]
@onready var sonido_camara = load("res://Assets/SFX/camera-shutter-and-flash-combined-6827.mp3")
var orejas = 0
var input: Vector2 = Vector2.ZERO
var esp = Input.is_action_pressed("Space")
func _ready():
	
	#print(str(get_node(".").get_position().x))
	get_node("AnimatedSprite2D").play("default")
	#add_to_group("Jugador")
func _physics_process(delta): 
	move_and_slide()

	input = Input.get_vector("Left", "Right", "Up", "Down")
	if Input.is_action_just_pressed("Left"):
		get_node("AnimatedSprite2D").set_scale(Vector2(-1,1))
		if not Input.is_action_pressed("Space"):
			get_node("AnimatedSprite2D").set_animation("default")
		
		#$Sprite2D.set_scale(Vector2(20,20)) d	
		
		#$Sprite2D.set_rotation_degrees(270)
		
	elif Input.is_action_just_pressed("Right") :
		#print(str(get_node(".").get_position().x))
		
		get_node("AnimatedSprite2D").set_scale(Vector2(1,1))
		if not Input.is_action_pressed("Space"):
			get_node("AnimatedSprite2D").play()
			get_node("AnimatedSprite2D").set_animation("default")
		
		#$Sprite2D.set_rotation_degrees(-270)
		
	velocity.x = input.x * h_movespeed
	velocity.y = input.y * v_movespeed
	if Input.is_action_pressed("Space"):
		#get_node("CollisionShape2D").set_debug_color( Color(242, 0,144,255)) 
		#get_node("Sprite2D").set_scale(Vector2(-1,1))
		#_escuchar_sfx()
		
		get_node("AnimatedSprite2D").set_animation("pat")
		get_node("AnimatedSprite2D").play()
		
	else:
		
		get_node("AnimatedSprite2D").set_animation("default")
		
		#get_node("AnimatedSprite2D").play("default")
#func aparicion()
#func _escuchar_sfx():
	#oreja[orejas].instantiate()
		#$"../AudioStreamPlayer2D".set_autoplay(true)
	#get_parent().get_node("AudioStreamPlayer2D").set_stream(sonido_camara)
	#get_parent().get_node("AudioStreamPlayer2D")._set_playing(true) 
	


		#$Area2D/CollisionShape2D.set_scale(Vector2(270,270)) 
		
