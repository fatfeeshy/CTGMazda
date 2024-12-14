extends Area2D
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

func _on_body_entered(body: Node2D) -> void:
	character_body_2d.position = Vector2(0,-8)
	character_body_2d.dienoise.play()
	Deathcounter.DeathCounter += 1
