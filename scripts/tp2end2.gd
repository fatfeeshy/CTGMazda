extends Area2D

@onready var dream_bg: Sprite2D = $"../DreamBg"

var StartTP := false

func _on_body_entered(_body: Node2D) -> void:
	StartTP = true

func _physics_process(_delta: float) -> void:
	if StartTP == true:
		dream_bg.self_modulate.a += 0.008
		dream_bg.self_modulate.a = clamp(dream_bg.self_modulate.a, 0, 2)
	
	if dream_bg.self_modulate.a == 2:
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
