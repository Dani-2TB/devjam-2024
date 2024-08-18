extends Area2D
@export var vida : Node2D

func _ready():
	self.body_entered.connect(_on_body_entered)
	

func _on_body_entered(body):
	print("colisionaste")
	var damage = body.get_node("damage_box").damage_user
	vida.restar_vida(damage)

