extends Area2D

# Definir una señal personalizada (opcional)
signal mi_senal

func _ready():
	# Conectar la señal incorporada `body_entered` a la función `_on_body_entered`
	pass

func _body_entered(body):
	emit_signal("body_entered")


