extends Area2D

var StartTP := false

@onready var timer: Timer = $"../Timer"
@onready var dream_bg: Sprite2D = $"../DreamBg"

func _on_body_entered(_body: Node2D) -> void:
	timer.start()

func _on_timer_timeout() -> void:
	StartTP = true

func _physics_process(delta: float) -> void:
	if StartTP == true:
		dream_bg.self_modulate.a += 0.01
		dream_bg.self_modulate.a = clamp(dream_bg.self_modulate.a, 0, 2.5)
	if dream_bg.self_modulate.a == 2.5:
		get_tree().change_scene_to_file("res://scenes/spenta_level_reg.tscn")
