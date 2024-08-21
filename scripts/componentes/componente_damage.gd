extends Area2D
@export var damage_max:int = 5
var damage_user

func _ready():
	damage_user= damage_max
