extends Area2D
class_name DetectAreaMachineComponent

@export var parent_component: Node
var next_machine_ref
var aux_int: int = 0

func detect_machine():
	var parent_components = self.get_overlapping_areas()
	parent_component.next_machine_ref = parent_components[0].get_parent()
#	on_area()

func on_area():
	$CollisionShape2D.disabled = false
func off_area():
	print("desactivao")
	$CollisionShape2D.disabled = true
	

func _on_area_entered(area):
	pass
#	print("detect machine")
#	print(area)
#	parent_component.next_machine_ref = area.get_parent()
#	parent_component.next_machine_id = area.get_machine_id()
#	off_area()
	
