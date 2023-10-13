extends Node2D

var item_base = preload("res://Scenes/Items/Base_Spawn_Item/Base_Spawn_Item.tscn")
@export var area_component: DetectItemComponent
@export var rotate_component: RotateComponent
@export var machine_detect_component: DetectAreaMachineComponent

var item_pick_id: int = 0
var im_have_item = false
var machine_id = 1
var next_machine_dont_open = true
var next_machine_id: int = 0
var next_machine_ref

func move_item():
	area_component.stop_cath()
	machine_detect_component.detect_machine()
	$Delay.start()

func _ready():
	pass


func spawn_item():
	next_machine_id = next_machine_ref.machine_id
	if item_pick_id != 0:
		
		if next_machine_id == 4:
			
			next_machine_dont_open = next_machine_ref.try_put_item(item_pick_id)
			
			if next_machine_dont_open == true:
				item_pick_id = 0
				im_have_item = false
				item_pass()
			else:
				item_not_pass()
		
		elif next_machine_id == 0:
			var new_item_pos = $DropPosition.global_position
			var new_item = item_base.instantiate()
			new_item.set_item_id(item_pick_id)
			new_item.global_position = new_item_pos
			get_tree().get_root().add_child(new_item)
			item_pick_id = 0
			im_have_item = false
			item_pass()
			
	else:
		pass
	$Delay.start()


func to_rotate(aux_id):
	rotate_component.rotate_item(aux_id)


func item_pass():
	$Conveyor_base/Direction5.self_modulate = Color.BLUE
	await get_tree().create_timer(0.3).timeout
	$Conveyor_base/Direction5.self_modulate = Color.WHITE
	
func item_not_pass():
	$Conveyor_base/Direction5.self_modulate = Color.RED
	await get_tree().create_timer(0.3).timeout
	$Conveyor_base/Direction5.self_modulate = Color.WHITE

func _on_delay_timeout():
	if im_have_item == true and item_pick_id != 0:
		spawn_item()
	elif im_have_item == false and item_pick_id == 0:
		area_component.start_catch()
