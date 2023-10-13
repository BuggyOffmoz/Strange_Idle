extends Node2D
class_name RotateComponent

@export var paret_component: Node

var rotate_vector

func rotate_item(aux_rotate_direction: int):
	var to_local_pos
	match aux_rotate_direction:
		1:
			paret_component.rotation_degrees = 180
			rotate_vector = Vector2(32,32)
#			paret_component.position = to_local_pos
		2:
			paret_component.rotation_degrees = 0
			rotate_vector = Vector2(0,0)
#			paret_component.position = to_local_pos
		3:
			paret_component.rotation_degrees = 90
			rotate_vector = Vector2(32,0)
#			paret_component.position = to_local_pos
		4:
			paret_component.rotation_degrees = 270
			rotate_vector = Vector2(0,32)
#			paret_component.position = to_local_pos
	change_pos_in_rotate()


func change_pos_in_rotate():
	paret_component.global_position += rotate_vector 
