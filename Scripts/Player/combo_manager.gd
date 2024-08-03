extends Node2D

var combo_queue = []
var timer

func _ready():
	timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
func _physics_process(delta):
	var input = get_input()
	combo_queue.push(input)

func _on_timer_timeout():
	combo_queue.pop_front()

func get_input():
	if Input.is_action_just_pressed("Left"):
		return "left"
	if Input.is_action_just_pressed("right"):
		return "right"
	if Input.is_action_just_pressed("Up"):
		return "up"
	if Input.is_action_just_pressed("Down"):
		return "down"
