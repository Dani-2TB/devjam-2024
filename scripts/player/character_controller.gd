extends CharacterBody2D
class_name CharacterController

# nodos que utilizare 
@export var vida : Node2D
@export var golpe_box: Area2D
@export var hitbox: Area2D
@export var combo_manager: ComboManager

#@onready var escena_jugador = load("res://Scenes/froak_frodinand.tscn")
#variables de movimiento
@export var h_movespeed: int = 200 #velocidad de movimiento horizontal
@export var v_movespeed: int = 150 #velocidad de movimiento vertical, mas baja que la horizontal para dar efecto 3D
var pos_jugador = null
var h_dashspeed:int = 2000
var v_dashspeed:int = 1500
var input: Vector2 = Vector2.ZERO
# variables para golpear
var can_attack:bool = true # para saber si puede atacar o no
var timer:Timer
var state: String = "caminando"

func _ready():
	add_to_group("Jugador")
	timer = $canattack
	timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta): 
	input = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_just_pressed("left"):
		get_node("Sprite").flip_h = true
		$Sprite.play("caminar")
		state = "caminando"
		#$Sprite2D.set_scale(Vector2(20,20)) d	
		#$Sprite2D.set_rotation_degrees(270)
	elif Input.is_action_just_pressed("right") :
		get_node("Sprite").flip_h = false
		$Sprite.play("caminar")
		state = "caminando"
		#$Sprite2D.set_rotation_degrees(-270)
	if Input and Input.is_action_just_pressed("dash"):
		velocity.x = input.x * h_dashspeed
		velocity.y = input.y * v_dashspeed
		state = "dashing"
	else: 
		velocity.x = input.x * h_movespeed
		velocity.y = input.y * v_movespeed
	if Input.is_action_just_pressed("saltar"):
		state = "jumping"
		get_node("Sprite").set_scale(Vector2(-1,1))
#func aparicion()
	move_and_slide()
	gameover(vida.vida_player)
	if Input.is_action_just_pressed("golpe") and can_attack:
		state = "attacking"
		golpe_box.damage_user = 1
		get_node("Sprite").play("golpe")
		golpe_box.get_child(0).disabled = false
		move_shape(22, golpe_box)
		can_attack=false
		$canattack.start()

	elif  Input.is_action_just_pressed("patada") and can_attack:
		state = "attacking"
		golpe_box.damage_user = 2
		golpe_box.get_child(0).disabled = false
		move_shape(30, golpe_box)
		get_node("Sprite").play("patada")
		can_attack=false
		$canattack.start()
	
	if (velocity.x != 0 or velocity.y != 0) and state != "attacking":
		$Sprite.play("caminar")
	elif state != "attacking":
		$Sprite.play("default")
	
func _on_timer_timeout():
	golpe_box.get_child(0).disabled = true
	can_attack= true
func move_shape(amount, nodo):
	var shape = nodo.get_child(0)
	if get_node("Sprite").flip_h:
		shape.position.x= -1 * amount 
	else:
		shape.position.x= amount
func gameover(hp):
	if hp<=0: self.visible = false
