extends Node2D

var item_base = preload("res://Scenes/Items/Base_Spawn_Item/Base_Spawn_Item.tscn")
@export var rotate_component: RotateComponent

var item_filter_a = 1
var item_filter_b = 2
var item_filter_c = 3


var machine_id = 4

var im_working = false
var itemA = false
var itemB = false
var itemC = false



func to_rotate(aux_id):
	rotate_component.rotate_item(aux_id)


func try_put_item(aux_item_id: int):
	if aux_item_id == 1:
		if itemA == false:
			itemA = true
			$FromA.frame = 13
			return(true)
			
		else:
			return(false)
	elif aux_item_id == 2:
		if itemB == false:
			itemB = true
			$FromB.frame = 16
			
			return(true)
			
		else:
			return(false)
	else:
		return(false)


func generate_new_item():
	var new_item_pos = $PositionOutput.global_position
	var new_item = item_base.instantiate()
	new_item.set_item_id(3)
	new_item.global_position = new_item_pos
	get_tree().get_root().add_child(new_item)


func _on_findout_delay_timeout():
	if itemA == true and itemB == true:
		im_working == true
		$To.frame = 22
		
		$TimerManager/Findout_Delay.stop()
		$TimerManager/Work_Delay.start()


func _on_work_delay_timeout():
	generate_new_item()
	$To.frame = 1
	$FromB.frame = 1
	$FromA.frame = 1
	itemA = false
	itemB = false
	im_working = false
	$TimerManager/Findout_Delay.start()
