extends Node2D
@export var vida : Node2D
var health = vida.vida_player
# Called when the node enters the scene tree for the first time.
func ready():
	if health<=0 :
		queue_free()
	
