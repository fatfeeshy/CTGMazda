extends Area2D

@onready var character: CharacterBody2D = $"../character"

func _on_body_entered(_body: Node2D) -> void:
	character.WishID = 1 # fire wish

func _on_body_exited(_body: Node2D) -> void:
	character.WishID = 0 # no wish