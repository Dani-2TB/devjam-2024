extends Timer

 
# Called when the node enters the scene tree for the first time.
func _ready():
	#set_wait_time(5)
	var timero = get_node(".")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func timeout():
	
	emit_signal("timeout")
