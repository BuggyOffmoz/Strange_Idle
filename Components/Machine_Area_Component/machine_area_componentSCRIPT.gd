extends Area2D
class_name MachineAreaComponent

@export var parent_component: Node

func get_machine_id():
	return(parent_component.machine_id)
