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

func _ready():
	add_to_group("Jugador")

func _physics_process(delta): 
	input = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_just_pressed("left"):
		get_node("Sprite").set_scale(Vector2(-1,1))
		golpe_box.position.x = -44
		#$Sprite2D.set_scale(Vector2(20,20)) d	
		#$Sprite2D.set_rotation_degrees(270)
	elif Input.is_action_just_pressed("right") :
		get_node("Sprite").set_scale(Vector2(1,1))
		golpe_box.position.x = 44
		#$Sprite2D.set_rotation_degrees(-270)
	if Input and Input.is_action_just_pressed("dash"):
		velocity.x = input.x * h_dashspeed
		velocity.y = input.y * v_dashspeed
	else: 
		velocity.x = input.x * h_movespeed
		velocity.y = input.y * v_movespeed
	if Input.is_action_just_pressed("saltar"):
		get_node("Sprite").set_scale(Vector2(-1,1))

#func aparicion()
	move_and_slide()
	if Input.is_action_just_pressed("golpe") and can_attack:
		golpe_box.get_child(0).disabled = false
		move_shape(-10,golpe_box)
		can_attack=false
		$canattack.start()

	elif  Input.is_action_just_pressed("patada") and can_attack:
		golpe_box.get_child(0).disabled = false
		move_shape(10, golpe_box)
		can_attack=false
		$canattack.start()

func _on_timer_timeout():
	golpe_box.get_child(0).disabled = true
	can_attack= true
func move_shape(amount, nodo):
	var shape = nodo.get_child(0)
	shape.position.y= amount
