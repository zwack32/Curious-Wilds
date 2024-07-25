extends CharacterBody2D

#basic game loop variables
var health = 100
var player_temperature = 70
var water = 100
var energy = 2000

#move to other script ASAP
var time = 0 #midnight

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("test")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * 4
	
	energy -= 2000/1440 * delta * 4
	
	print (energy)
