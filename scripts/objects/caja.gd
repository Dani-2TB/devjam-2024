extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var trigger = get_node("TriggerSalto")
	var timer = get_node("Timer")
	trigger.body_entered.connect(_on_body_entered)
	trigger.body_exited.connect(_on_body_exited)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_exited(body):
		var colision = get_node("Colision")
		colision.disabled = false
func _on_body_entered(body): 
		var colision = get_node("Colision")
		colision.disabled = true
func _on_timer_timeout():
	pass
