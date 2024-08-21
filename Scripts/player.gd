extends CharacterBody2D

#basic game loop variables
var health = 100 #arbitrary
var player_temperature = 70 #freedom units
var water = 800 #centicups
var energy = 2000 #Kcals

var speed = 200

var clothing_temperature = 0 #naked i guess

@onready var health_bar = $Health_Bar
@onready var temperature_bar = $Temperature_Bar
@onready var water_bar = $Water_Bar
@onready var energy_bar = $Energy_Bar
@onready var game_manager = $TestScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#player_temperature = game_manager.gettemperature + gear.temperature_boost
	update_temp()
	check_vitals(delta)
	move(delta)
	update_bars()

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
		
func update_bars():
	health_bar.value = health
	temperature_bar.value = player_temperature
	water_bar.value = water
	energy_bar.value = energy

func update_temp():
	#player_temperature = game_manager.get(temperature) + clothing_temperature
	#david is supposed to make this work
	pass
