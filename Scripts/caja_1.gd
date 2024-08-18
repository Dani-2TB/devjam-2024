extends StaticBody2D
# Called when the node enters the scene tree for the first time.
var instancia = 0
@export var nodo = 0
#var froakfrodinand = get_parent().get_node("FroakFrodinand").posx
func _ready():
	var Area2D2 = get_node("Area2D2")
	var timer = get_node("Timer")
	var result = timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	var resulta = Area2D2.connect("body_entered", Callable(self, "_on_area_2d_body_entered"))
func _on_area_2d_body_entered(body):
	if Input.is_action_just_pressed("Right"):
		print(get_node("Timer").get_time_left())
	if Input.is_action_pressed("Space"):
		
		get_node("Timer").start()
		get_node(".").set_collision_layer(2)  
			
		
		nodo = load("res://Scenes/alarma.tscn")
		instancia = nodo.instantiate()
		
		#get_node(".").add_child(instancia)
		#get_node(".").remove_child(get_node("colision"))
		
func _on_Timer_timeout():
	get_node(".").set_collision_layer(1)
	print(get_node("Timer").get_time_left())



