extends Node2D

var lives = 3
var score = 0

# Reference to Player node in this Scene
@onready var player = $Player
# Reference to the HUD node
@onready var hud = $UI/HUD
# Reference the UI node
@onready var ui = $UI

# Reference to EnemyHitSound
@onready var enemyHitSound = $EnemyHitSound
# Reference to PlayerHitSound
@onready var playerHitSound = $PlayerHitSound

var gameOverScene = preload("res://Scenes/game_over_screen.tscn")

# Initialize score value to 0
func _ready():
	hud.setScoreLabel(score)
	hud.setLives(lives)

# Detect when an area enters the Deathzone area
# Destroy enemy
func _on_deathzone_area_entered(area):
	area.queue_free()

# Reduce Player's life by 1
func _on_player_took_damage():
	playerHitSound.play()
	lives -= 1
	hud.setLives(lives)
	if (lives == 0):
		print("Game Over")
		player.die()	# Or call player.queue.Free()
		
		# Coroutine to wait before executing the rest of the code
		await get_tree().create_timer(1.15).timeout
		
		# Instantiate the GameOver Scene
		var gameOver = gameOverScene.instantiate()
		# Set score in GameOver Scene
		gameOver.setScore(score)
		ui.add_child(gameOver)

# Add enemy instance as child to enemySpawner
func _on_enemy_spawner_enemy_spawn(enemyInstance):
	enemyInstance.connect("died", onEnemyDied)
	add_child(enemyInstance)

# Increase player score when enemy is destroyed 
func onEnemyDied():
	score += 100
	hud.setScoreLabel(score)
	# Play sound
	enemyHitSound.play()

# Add path enemy instance as a child to enemySpawner
func _on_enemy_spawner_path_enemy_spawn(pathEnemyInstance):
	add_child(pathEnemyInstance)
	#connect the signal to the method
	pathEnemyInstance.enemy.connect("died", onEnemyDied)
