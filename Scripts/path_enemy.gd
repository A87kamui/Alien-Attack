extends Path2D

# Reference to PahtyFollow2D
@onready var pathFollow = $PathFollow2D
# Reference to Enemy
@onready var enemy = $PathFollow2D/Enemy

# Set progress ratio
func _ready():
	pathFollow.set_progress_ratio(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pathFollow.progress_ratio -= 0.25 * delta 
	if (pathFollow.progress_ratio <= 0):
		queue_free()
