extends Node2D
@export var generador: Generador
@onready var levels = [load("res://Scenes/world.tscn")]


var level = 1
var control = 0

func _ready():
	levels[level-1].instantiate()
	#var nivel = levels[level-1]
	#nivel.get_pos()
	#if get_node("pantallas/Node2D1"):
		#if get_node("pantallas/Node2D1").pantalla == 2:
			#print("pantalla2")
			#remove_child(get_node("pantallas"))
