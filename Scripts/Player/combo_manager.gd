extends Node2D
class_name ComboManager

@export var combos_file: Resource
@export var combo_time: float

var combo_queue = []
var timer: Timer
var combos_db: Dictionary
var combo_to_execute: String
signal execute_combo

func push_input(input: String):
	combo_queue.push_back(input)

func get_combo_time():
	return combo_time

func set_combo_time(value: float):
	if value > 0.5:
		combo_time = value
		return true
	return false

func _ready():
	timer = get_node("ComboTimer")
	timer.timeout.connect(_on_timer_timeout)
	timer.wait_time = combo_time
	timer.start()
	combos_db = parse_json()
	
	if not combos_db:
		print("error")

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		push_input("attack")
		timer.start()
	if Input.is_action_just_pressed("kick"):
		push_input("kick")
		timer.start()
	
	if combo_queue.size() > 0:
		if is_in_combos():
			var combo = get_combo()
			if combo != null:
				combo_to_execute = combo
				execute_combo.emit()
				combo_queue.clear()
		else:
			timer.stop()
			timer.timeout.emit()

func get_combo():
	var combo = combos_db.find_key(combo_queue)
	return combo

func is_in_combos():
	for combo in combos_db.values():
		if is_subset_of(combo_queue, combo):
			return true
	return false

func is_subset_of(array_1: Array, array_2: Array):
	if array_1.size() > array_2.size():
		return false
	var sub_array: Array = array_2.slice(0, array_1.size())
	return array_1 == sub_array

func array_to_string(array: Array):
	var string: String = "["
	for item in array:
		string += " \"" + item + "\", "
	string += "]"
	return string
	
func _on_timer_timeout():
	combo_queue.clear()


func parse_json():
	var combos_json = FileAccess.get_file_as_string(combos_file.resource_path)
	var json = JSON.new()
	var error = json.parse(combos_json)
	if error == OK:
		var data = json.data
		if typeof(data) == TYPE_DICTIONARY:
			return data
		else:
			print(
				"Error 2: Tipo de variante no esperado, se esperara TYPE_DICTIONARY, pero se obtuvo ", 
				typeof(data)
				)
			return 0
	else:
		print(
			"Error al parsear JSON: ", 
			json.get_error_message(), 
			" in ", combos_json, 
			" en la linea ", 
			json.get_error_line()
			)
		return 0

func _on_execute_combo():
	print(combo_to_execute)
	combo_to_execute = ""
