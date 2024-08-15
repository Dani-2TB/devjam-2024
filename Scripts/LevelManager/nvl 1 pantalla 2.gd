extends Node2D

var instan3 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var Area2DN = get_node("Area2D8")
	var resulta = Area2DN.connect("body_entered", Callable(self, "_on_area_2d_body_entered"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
	#print("El cuerpo ha entrado en el área.") 
		var nv3 = load("res://Scenes/nvl 1 pantalla 3.tscn")
		instan3 = nv3.instantiate()
		get_parent().get_node(".").add_child(instan3)
		#get_parent().get_node("Node2D").set_draw_behind_parent(true)
		get_parent().get_parent().get_node("FroakFrodinand").set_position(Vector2(-500,-1))
		print("entra2")
		get_node(".").queue_free()
		#get_parent().get_node(".").remove_child(get_node("Node2D1"))
		#get_parent().get_node(".").remove_child(get_parent().get_node("Node2D2"))
		
	
