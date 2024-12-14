extends Area2D

@onready var main_character: CharacterBody2D = $"../CharacterBody2D"

func _on_body_entered(_body: Node2D) -> void:
	main_character.Lives -= 1
	main_character.position.x = 0
	main_character.position.y = -8
	main_character.dienoise.play()
	Deathcounter.DeathCounter += 1
