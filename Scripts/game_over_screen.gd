extends Control

# Update final score
func setScore(newScore):
	$Panel/Score.text = "SCORE: " + str(newScore)

# Reset current scene
func _on_retry_button_pressed():
	get_tree().reload_current_scene()
