extends Node

var time = 0 #midnight
var temperature = 0 #in freeedom units
var day_length = 1440 #in seconds
var region = "string"

@onready var nightshade = $NightShade

func _process(delta):
	update_time(delta)
	update_region()

func update_time(delta):
	time += delta
	if time >= day_length:
		time = 0
	
	if time < day_length/2:
		print ("am")
		nightshade.hide()
		
	elif time > day_length/2:
		print("pm")
		nightshade.show()

func update_region():
	if region == "desert":
		pass
	elif region == "grass":
		pass
	elif region == "mountains":
		pass
	elif region == "forest":
		pass


func _on_forest_area_body_entered(body):
	region = "forest"

func _on_grass_area_body_entered(body):
	region = "grass"

func _on_mountain_area_body_entered(body):
	region = "mountain"

func _on_desert_area_body_entered(body):
	region = "desert"
