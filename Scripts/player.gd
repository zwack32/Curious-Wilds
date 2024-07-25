extends CharacterBody2D

#basic game loop variables
var health = 100
var player_temperature = 70
var water = 800
var energy = 2000

var speed = 200

@onready var energy_bar = $Energy_Bar

#move to another script ASAP
var time = 0 #midnight

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("test")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_vitals(delta)
	move(delta)
	energy_bar.value = energy

func move(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	position += velocity.normalized() * speed * delta
	

func check_vitals(delta):
	time += delta
	
	energy -= 2000/1440 * delta
	
	water -= 800/1440 * delta
	
	if player_temperature > 90:
		water -= 100/1440 * delta
	if player_temperature < 50:
		energy -= 100/1440 * delta
	if player_temperature > 100:
		water -= 100/1440 * delta
		health -= 20/1440 * delta
	if player_temperature < 30:
		energy -= 100/1440 * delta
		health -= 20/1440 * delta
	
	if energy < 200:
		health -= 10/1440
	if water < 200:
		health -= 25/1440
