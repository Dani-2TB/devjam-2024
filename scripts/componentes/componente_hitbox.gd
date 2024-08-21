extends Area2D
@export var vida : Node2D

func _ready():
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area.is_in_group("hitbox"):
		return
	var damage:int = area.damage_user
	if damage == null:
		return
	
	vida.restar_vida(damage)
	print(vida.vida_player)

	if area.is_in_group("curas"):
		pass



