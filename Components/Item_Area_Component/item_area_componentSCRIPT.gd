extends Area2D
class_name ItemAreaComponent

@export var parent_item_component: ItemComponent


func im_in_pick():
	parent_item_component.im_picked = true
	parent_item_component.in_movement = false


func change_direction(aux_direction_vector: Vector2):
	parent_item_component.change_direction_movement(aux_direction_vector)


func get_item_id():
	return(parent_item_component.item_id)


func destroy_item():
	parent_item_component.queue_free()
