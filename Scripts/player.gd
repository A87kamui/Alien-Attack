extends CharacterBody2D

# Custom signal to detect damage
signal tookDamage

var speed = 300
var rocketScene = preload("res://Scenes/rocket.tscn")
@onready var rocketContainer = $RocketContainer

# Reference the RocketSound
@onready var rocketSound = $RocketSound

# Check if player presses shoot button to shoot
func _process(delta):
	if (Input.is_action_just_pressed("shoot")):
		shoot()

# Player movement 
func _physics_process(delta):
	velocity = Vector2(0, 0)	# Reset velocity to 0
	if (Input.is_action_pressed("move_right")):
		velocity.x = speed
	if (Input.is_action_pressed("move_left")):
		velocity.x = -speed
	if (Input.is_action_pressed("move_up")):
		velocity.y = -speed
	if (Input.is_action_pressed("move_down")):
		velocity.y = speed
	
	move_and_slide()
	
	# Clamp player to stay within game
	var screenSize = get_viewport_rect().size	
	# Clamp 3rd alternative 
	global_position = global_position.clamp(Vector2(0,0), screenSize)

# Shoots a rocket
func shoot():
	var rocketInstance = rocketScene.instantiate()
	rocketContainer.add_child(rocketInstance)
	rocketInstance.global_position = global_position
	rocketInstance.global_position.x += 80
	rocketSound.play()
	

# Reduce Player life
func takeDamage():
	emit_signal("tookDamage")

# Remove Player
func die():
	queue_free()
