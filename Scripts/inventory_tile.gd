extends Control
class_name InventoryTile

var inventory: Inventory
var grid_position: Vector2

func _ready():
	inventory = self.get_parent().get_parent()
	grid_position = inventory.register_inventory_tile(self)

func _process(delta):
	pass

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	print("CAN")
	var new_inv = Inventory.inventory_place_with_id(inventory.inventory, int(grid_position.x), int(grid_position.y), data)
	var has_overlap = Inventory.inventory_has_overlap(new_inv)
	print(has_overlap)
	return true
	# return has_overlap

func _drop_data(_at_position: Vector2, data: Variant):
	print("DROP", data)

