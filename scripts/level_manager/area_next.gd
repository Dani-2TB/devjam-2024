extends Area2D

func _ready():
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(body):
	var level = get_parent().get_parent()
	level.current_screen += 1
	level.change_screen()
	print("area next")
