extends Node2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D

func _ready() -> void:
	character_body_2d.WishID = 1
	character_body_2d.FinishedRegLevel = true
	Deathcounter.FinishedRegLevel = true