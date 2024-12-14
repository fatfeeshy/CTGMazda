extends Control

@onready var deathdisplay: Label = $Camera2D/deathdisplay
@onready var ranking: Label = $Camera2D/ranking

func _ready() -> void:
	deathdisplay.text = "Deaths: " + str(Deathcounter.DeathCounter)
	determineRanking()

func determineRanking():
	if Deathcounter.DeathCounter == 0:
		ranking.text = "Ranking: " + "u cheated"
	elif Deathcounter.DeathCounter > 0 and Deathcounter.DeathCounter <= 35:
		ranking.text = "Ranking: " + "S"
	elif Deathcounter.DeathCounter > 35 and Deathcounter.DeathCounter <= 50:
		ranking.text = "Ranking: " + "A"
	elif Deathcounter.DeathCounter > 50 and Deathcounter.DeathCounter <= 70:
		ranking.text = "Ranking: " + "B"
	elif Deathcounter.DeathCounter > 70 and Deathcounter.DeathCounter <= 100:
		ranking.text = "Ranking: " + "C"
	elif Deathcounter.DeathCounter > 100 and Deathcounter.DeathCounter <= 150:
		ranking.text = "Ranking: " + "D"
	else:
		ranking.text = "Ranking: " + "F"
