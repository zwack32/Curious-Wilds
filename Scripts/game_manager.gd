extends Node

var time = 0 #midnight
var temperature = 0 #in freeedom units
var day_length = 1440 #in seconds

func _process(delta):
	time += delta
