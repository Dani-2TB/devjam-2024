extends Area2D
@export var vida : Node2D

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	var damage = body.get_node("damage_box").damage_user
	if damage == null:
		return
	vida.restar_vida(damage.damage_user)

