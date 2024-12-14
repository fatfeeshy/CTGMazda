extends Node2D
@onready var character: CharacterBody2D = $character
func _ready() -> void:
	Deathcounter.DeathCounter = 0
	character.FinishedRegLevel = false
