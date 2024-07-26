extends Control
class_name Inventory

# const GUN: Array[int] = [
# 	1, 1, 1,
# 	0, 0, 1,
# ]
# const GUN_SIZE := Vector2(3, 2)

const BOX: Array[int] = [
	1, 1,
	1, 1,
]
const BOX_SIZE := Vector2(2, 2)

const GRID_X = 10
const GRID_Y = 5

var inventory: Array[int]
var inventory_tiles: Array[Node]

func _enter_tree():
	for _i in GRID_X * GRID_Y:
		inventory.append(0)

static func inventory_place(inv: Array[int], x: int, y: int, item: Array[int], item_x: int, item_y: int) -> Array[int]:
	var grid = inv.duplicate()

	if x < 0 || y < 0 || x + item_x > GRID_X || y + item_y > GRID_Y:
		return []

	for yi in range(item_y):
		for xi in range(item_x):
			grid[(yi + y) * GRID_X + x + xi] += item[yi * item_x + xi]

	return grid

static func inventory_place_with_id(inv: Array[int], x: int, y: int, _item: int) -> Array[int]:
	return inventory_place(inv, x, y, BOX, int(BOX_SIZE.x), int(BOX_SIZE.y))

static func inventory_has_overlap(inv: Array[int]) -> bool:
	for i in inv:
		if i > 1:
			return true
	return false

func register_inventory_tile(tile: InventoryTile) -> Vector2:
	var ret = Vector2(inventory_tiles.size() % GRID_X, floori(float(inventory_tiles.size()) / GRID_X))
	inventory_tiles.append(tile)
	return ret

func update_inventory_tiles():
	pass

func _process(_delta):
	pass

