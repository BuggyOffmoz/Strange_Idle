extends Node2D

@export var rotate_component: RotateComponent

var machine_id = 2


func _ready():
	pass


func change_position_to_item(item_reference):
	var aux = self.rotation_degrees
	
	if aux == 0:
		item_reference.change_direction(Vector2(0,1))
	elif aux == 270:
		item_reference.change_direction(Vector2(1,0))
	elif aux == 180:
		item_reference.change_direction(Vector2(0,-1))
	else:
		item_reference.change_direction(Vector2(-1,0))



func to_rotate(aux_id):
	rotate_component.rotate_item(aux_id)


func _on_item_detect_area_entered(area):
	change_position_to_item(area)
