extends StaticBody2D
var is_jumping = false
var dentro = false
@onready var body =  get_tree().get_nodes_in_group("Jugador")[0]
@onready var timer =  get_node("Timer")
@onready var colision = get_node("colision")
# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("Timer")
	add_to_group("caja")
	is_jumping = get_tree().get_nodes_in_group("Jugador")[0].is_jumping
	var trigger = get_node("TriggerSalto")
	var timer = get_node("Timer")
	trigger.body_entered.connect(_on_body_entered)
	trigger.body_exited.connect(_on_body_exited)
	
func _process(delta):
	pass
func _on_body_entered(body): 
	pass
func _on_body_exited(body): 
	pass
