extends Node2D

var spawn_machine = preload("res://Scenes/Machinary/Spawner_Item/Spawner_Item.tscn")
var conveyor_machine = preload("res://Scenes/Machinary/Conveyor_Item/Conveyor_Item.tscn")
var arm_machine = preload("res://Scenes/Machinary/Arm_Item/Arm_Item.tscn")
var workable_machine = preload("res://Scenes/Machinary/Workable_Item/workable_item.tscn")
var focus_machine
var rotate_dir = 1




func _ready():
	focus_machine = spawn_machine


func _input(event):
	
	if event.is_action_pressed("one_ui"):
		focus_machine = spawn_machine
	elif event.is_action_pressed("two_ui"):
		focus_machine = conveyor_machine
	elif event.is_action_pressed("three_ui"):
		focus_machine = arm_machine
	elif event.is_action_pressed("four_id"):
		focus_machine = workable_machine
	
	if event.is_action_pressed("R_ui"):
		rotate_dir += 1
		if rotate_dir >= 5:
			rotate_dir = 1
			
		change_rotation_arrow()
	


func change_rotation_arrow():
		match rotate_dir:
			1:
				$"../CanvasLayer/Node2D".rotation_degrees = 0

			2:
				$"../CanvasLayer/Node2D".rotation_degrees = 180

			3:
				$"../CanvasLayer/Node2D".rotation_degrees = 270

			4:
				$"../CanvasLayer/Node2D".rotation_degrees = 90



func generate_machine(aux_position_reference: Vector2):
	var new_machine = focus_machine.instantiate()
	new_machine.global_position = aux_position_reference
	new_machine.to_rotate(rotate_dir)
	self.add_child(new_machine)
