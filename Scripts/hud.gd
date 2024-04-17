extends Control

# Reference the score node
@onready var score = $Score
# Reference to the LivesLeft node
@onready var livesLeft = $LivesLeft 

# Update the score text
func setScoreLabel(newScore):
	score.text = "SCORE: " + str(newScore)

# Update the player lives
func setLives(amount):
	livesLeft.text = str(amount)
