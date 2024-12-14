extends Area2D
@onready var dream_bg: Sprite2D = $"../DreamBg"
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

var StartTP := false

func _on_body_entered(_body: Node2D) -> void:
	StartTP = true
	character_body_2d.FinishedRegLevel = true

func _physics_process(_delta: float) -> void:
	if StartTP == true:
		dream_bg.self_modulate.a += 0.008
		dream_bg.self_modulate.a = clamp(dream_bg.self_modulate.a, 0, 2)
	
	if dream_bg.self_modulate.a == 2:
		match randi_range(1,2):
			1: get_tree().change_scene_to_file("res://scenes/tishtrya_dream.tscn")
			2: get_tree().change_scene_to_file("res://scenes/spenta_dream.tscn")
