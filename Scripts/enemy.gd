extends Area2D

@export var speed = 250
signal died

# Move Enemy towards player
func _physics_process(delta):
	global_position.x -= speed * delta

# Delete Enemy when collides with a Rocket
func die():
	emit_signal("died")
	queue_free()

# Detect when Player collides with Enemy
# Player takes damage
# Destroy Enemy
func _on_body_entered(body):
	body.takeDamage()
	die()
