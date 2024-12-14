extends Area2D

var startTP := false

@onready var dream_bg: Sprite2D = $"../DreamBg"
@onready var timer: Timer = $Timer
@onready var character: CharacterBody2D = $"../character"

func _physics_process(_delta: float) -> void:
	if startTP == true:
		dream_bg.self_modulate.a += 0.01
		dream_bg.self_modulate.a = clamp(dream_bg.self_modulate.a, 0, 2.5)
	if dream_bg.self_modulate.a == 2.5:
		determineLevel()
func _on_body_entered(_body: Node2D) -> void:
	timer.start()
func _on_timer_timeout() -> void:
	startTP = true

func determineLevel():
	if Deathcounter.FinishedRegLevel == false:
		get_tree().change_scene_to_file("res://scenes/AtarLevelRegular.tscn")
	elif Deathcounter.FinishedRegLevel == true:
			get_tree().change_scene_to_file("res://scenes/atar_level_final.tscn")
