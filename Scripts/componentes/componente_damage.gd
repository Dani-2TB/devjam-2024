extends Area2D
@export var damage_max:int = 5
var damage_user:int
func _ready():
	var damage_user=damage_max
