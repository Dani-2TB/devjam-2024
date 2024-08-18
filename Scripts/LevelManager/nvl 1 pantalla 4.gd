extends Node2D

var instan5 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var Area2DN = get_node("Area2D8")
	var resulta = Area2DN.connect("body_entered", Callable(self, "_on_area_2d_body_entered"))
	#Recibe la señal del area 2d y la conecta con el metodo 
	# que está al pie de el script


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Jugador:
	#detecta si el jugador entro al area2d
		var nv5 = load("res://Scenes/nvl 1 pantalla 5.tscn")
		instan5 = nv5.instantiate()
		#Carga e instancia al nodo
		get_parent().get_node(".").add_child(instan5)
		#hace un get parent para añadir la escena instanciada
		get_parent().get_parent().get_node("FroakFrodinand").set_position(Vector2(-500,135))
		#Pone al jugador en el principio de la escena
		print("entra4")
		#hace un print para yo poder monitorear cuantas veces cambió de escena
		get_node(".").queue_free()
		#borra el nodo de la escena anterior

		
