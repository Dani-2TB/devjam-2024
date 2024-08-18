extends Node2D
var pantalla = 0
var instan2 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var Area2DN = get_node("Area2D8")
	var resulta = Area2DN.connect("body_entered", Callable(self, "_on_area_2d_body_entered"))
	pantalla = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
	#print("El cuerpo ha entrado en el área.") 
		
		var nv2 = load("res://Scenes/nvl 1 pantalla 2.tscn")
		instan2 = nv2.instantiate()
		get_parent().get_node(".").add_child(instan2)
		get_parent().get_node("Node2D").set_draw_behind_parent(true)
		get_parent().get_parent().get_node("FroakFrodinand").set_position(Vector2(-500,-1))
		get_node(".").queue_free()
		print("entra")
		pantalla = 2
	
