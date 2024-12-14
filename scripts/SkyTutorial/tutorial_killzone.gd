extends Area2D
@onready var character: CharacterBody2D = $"../character"
func _on_body_entered(_body: Node2D) -> void:
	character.position = Vector2(-99,-30)
	character.dienoise.play()
	Deathcounter.DeathCounter += 1
	#StateManager.death_counter += 1
