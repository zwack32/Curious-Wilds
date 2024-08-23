extends CharacterBody2D

#basic game loop variables
var health = 100.0 #arbitrary
var player_temperature = 70.0 #freedom units
var water = 800.0 #centicups
var energy = 2000.0 #Kcals

var speed = 200.0

var clothing_temperature = 0.0 #naked for now i guess
var day_length = 1440 #in seconds #eventually get this from game_manager

@onready var health_bar = $HealthBar
@onready var temperature_bar = $TemperatureBar
@onready var water_bar = $WaterBar
@onready var energy_bar = $EnergyBar

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
	energy -= 2000/day_length * delta
	
	water -= 800/day_length * delta
	
	if player_temperature > 90:
		water -= 100/day_length * delta
	if player_temperature < 50:
		energy -= 100/day_length * delta
	if player_temperature > 100:
		water -= 100/day_length * delta
		health -= 20/day_length * delta
	if player_temperature < 30:
		energy -= 100/day_length * delta
		health -= 20/day_length * delta
	
	if energy < 200:
		health -= 10/day_length
	if water < 200:
		health -= 25/day_length
		
func update_bars():
	health_bar.value = health
	temperature_bar.value = player_temperature
	water_bar.value = water
	energy_bar.value = energy

func update_temp():
	#player_temperature = game_manager.get(temperature) + clothing_temperature
	#david is supposed to make this work
	pass

func _on_mountain_area_body_entered(body):
	print("mountain!!!")


func _on_forest_area_body_entered(body):
	print("forest!!!")


func _on_grass_area_body_entered(body):
	print("grass!!!")


func _on_desert_area_body_entered(body):
	print("desert!!!")
