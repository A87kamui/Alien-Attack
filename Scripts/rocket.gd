extends Area2D

@export var speed = 500

@onready var visibleNotifier = $VisibleNotifier

func _ready():
	visibleNotifier.connect("screen_exited", _on_screen_exited)

# Update position 
func _physics_process(delta):
	# Multiplying speed by delta = how many pixels to move in a second
	# Speed will control the "How many" 
	# Delta will control the per second
	global_position.x += speed * delta

# Remove instance of Rocket
func _on_screen_exited():
	queue_free()

# Detect when an area enters the rocket area
func _on_area_entered(area):
	queue_free()
	area.die()
