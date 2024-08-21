extends CollisionShape2D
@export var vida: Node2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if vida.vida_player <0:
		queue_free()
