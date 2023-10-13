extends Area2D
class_name DetectItemComponent
@export var Parent_Machine: Node


func get_item_id(aux_item_id: int):
	Parent_Machine.item_pick_id = aux_item_id
	Parent_Machine.im_have_item = true
	Parent_Machine.move_item()

func stop_cath():
	print("intento parar AA")
	self.set_collision_mask_value(4,false)
func start_catch():
	self.set_collision_mask_value(4,true)

func _on_area_entered(area):
	get_item_id(area.get_item_id())
	area.destroy_item()


