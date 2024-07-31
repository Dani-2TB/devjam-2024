extends Node2D

@export var generador: Generador
@onready var levels = [load("res://Scenes/world.tscn")]
var level = 1
func _ready():
	levels[level-1].instantiate()
	
