extends Node2D


@export var vida_max:=10
var vida_player:int

func _ready() :
	self.vida_player = vida_max
	
func restar_vida(atack):
	self.vida_player -= atack
	
func sumar_vida(curas):
	self.vida_player += curas
	
