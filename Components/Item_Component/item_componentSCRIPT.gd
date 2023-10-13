extends Node2D
class_name ItemComponent


var speed = 1
@export var item_id: int = -1

var im_saturated = false
var in_movement = true
var im_picked = false

var direction: Vector2


func _ready():
	pass
	#self.rotation_degrees = -self.get_parent().rotation_degrees


func _process(delta):
	if in_movement:
		constant_movement(delta)
	else:
		pass


func constant_movement(delta):
	self.position += direction * speed


func set_item_id(aux_id_item: int):
	item_id = aux_id_item
	change_item_resource()


func set_global_pos(aux_vector_position: Vector2):
	self.global_position = aux_vector_position


func change_direction_movement(aux_new_direction_vector: Vector2):
	if aux_new_direction_vector != direction:
		direction = aux_new_direction_vector
	else:
		pass


func change_item_resource():
	match item_id:
		-1:
			$ItemSprite.frame = 3
		1:
			$ItemSprite.frame = 13
		2:
			$ItemSprite.frame = 16
		3:
			$ItemSprite.frame = 22

