extends Sprite2D

@onready var area_2d: Area2D = $Area2D
@onready var main_character: CharacterBody2D = $"../../CharacterBody2D"
@onready var dienoise: AudioStreamPlayer2D = $dienoise

func _on_body_entered(_body: Node2D) -> void:
	main_character.position.x = 0
	main_character.position.y = -8
	dienoise.play()
	Deathcounter.DeathCounter += 1
