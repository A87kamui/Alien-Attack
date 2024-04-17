extends Node2D

signal enemySpawn(enemyInstance)
signal pathEnemySpawn(pathEnemyInstance)

var enemyScene = preload("res://Scenes/enemy.tscn")
var pathEnemyScene = preload("res://Scenes/path_enemy.tscn")

# Get a reference on the SpawnPosition node
@onready var spawnPosition = $SpawnPosition 

# Call the spawnEnemy method
func _on_timer_timeout():
	spawnEnemy()

# Spawn an enemy
func spawnEnemy():
	var spawnPositiionsArray = spawnPosition.get_children()
	var randomSpawnPosition = spawnPositiionsArray.pick_random()
	
	var enemyInstance = enemyScene.instantiate()
	enemyInstance.global_position = randomSpawnPosition.global_position 
	emit_signal("enemySpawn", enemyInstance)

# Call the spawnPathEnemy method
func _on_path_enemy_timer_timeout():
	spawnPathEnemy()

# Spawn path enemy
func spawnPathEnemy():
	var pathEnemyInstance = pathEnemyScene.instantiate()
	emit_signal("pathEnemySpawn", pathEnemyInstance)



