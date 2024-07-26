extends Control
class_name InventoryItem

@export var item_id: int

func _get_drag_data(at_position: Vector2) -> int:
	print("GET")
	set_drag_preview(InventoryItem.new())
	return item_id
