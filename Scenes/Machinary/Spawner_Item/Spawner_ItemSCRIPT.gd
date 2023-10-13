extends Node2D

var item_base = preload("res://Scenes/Items/Base_Spawn_Item/Base_Spawn_Item.tscn")

@export var rotate_component: RotateComponent
@export_range(0,3) var id_item_generate: int

var machine_id = 3
var im_focus = false

func _ready():
	pass


func _process(delta):
	pass

func to_rotate(aux_id):
	rotate_component.rotate_item(aux_id)

func spawn_item():
	if id_item_generate != 0:
		var new_item_pos = $PositionOutput.global_position
		var new_item = item_base.instantiate()
		new_item.set_item_id(id_item_generate)
		new_item.global_position = new_item_pos
		get_tree().get_root().add_child(new_item)
	else:
		pass


func change_item():
	if id_item_generate == 1 or id_item_generate == 0 and im_focus == true:
		id_item_generate = 2
		$ItemSelect.frame = 16
	elif id_item_generate == 2 and im_focus == true:
		id_item_generate = 1
		$ItemSelect.frame = 13
		

func _on_delay_timeout():
	spawn_item()


func _on_mouse_click_detect_mouse_entered():
	im_focus = true
	$Base/FocusPanel.visible = true
	

func _on_mouse_click_detect_mouse_exited():
	im_focus = false
	$Base/FocusPanel.visible = false
	
