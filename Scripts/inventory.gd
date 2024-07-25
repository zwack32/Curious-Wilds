extends Control

# const GUN: Array[int] = [
# 	1, 1, 1,
# 	0, 0, 1,
# ]
# const GUN_SIZE := Vector2(3, 2)

const GRID_X = 10
const GRID_Y = 5

var inventory: Array[int]

func _enter_tree():
	for _i in GRID_X * GRID_Y:
		inventory.append(0)

func inventory_place(inv: Array[int], x: int, y: int, item: Array[int], item_x: int, item_y: int) -> Array[int]:
	var grid = inv.duplicate()

	if x < 0 || y < 0 || x + item_x > GRID_X || y + item_y > GRID_Y:
		return []

	for yi in range(item_y):
		for xi in range(item_x):
			grid[(yi + y) * GRID_X + x + xi] += item[yi * item_x + xi]

	return grid

func inventory_has_overlap(inv: Array[int]) -> bool:
	for i in inv:
		if i > 1:
			return true
	return false

func _process(_delta):
	pass

