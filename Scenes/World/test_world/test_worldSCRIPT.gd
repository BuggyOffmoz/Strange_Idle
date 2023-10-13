extends Node2D



@export var tile_world: Node
@export var tile_reference: Node

var its_posible_generate = true

func _ready():
	pass

func _input(event):
	
	if event.is_action_pressed("L_Click"):
		create_new_machinary()
	elif event.is_action_pressed("R_Click"):
		get_tree().call_group("spawner_group","change_item")


func _process(delta):
	move_construc_tile_to_mouse()

func move_construc_tile_to_mouse():
	if tile_world == null:
		pass
	else:
		tile_reference.global_position = tile_world.get_world_position_to_map_tile(get_global_mouse_position()) - Vector2(14,16)



func create_new_machinary():
	if its_posible_generate == true:
		$Machinary_Manager.generate_machine(tile_reference.global_position)
	else:
		pass
