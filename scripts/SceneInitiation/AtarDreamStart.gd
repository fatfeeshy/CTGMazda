extends Node2D

@onready var character: CharacterBody2D = $character

func _ready() -> void:
	character.WishID = 1
	get_tree().paused = false
