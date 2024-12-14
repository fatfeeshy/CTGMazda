extends Area2D

var passedThrough := false
@onready var dream_bg: Sprite2D = $"../DreamBg"

func _physics_process(_delta: float) -> void:
	if passedThrough == true:
		dream_bg.self_modulate.a += 0.1
		dream_bg.self_modulate.a = clamp(dream_bg.self_modulate.a, 0, 4)
	if dream_bg.self_modulate.a == 4:
			match randi_range(1,3):
				1: get_tree().change_scene_to_file("res://scenes/tutorial_dream_sequence.tscn")
				2: get_tree().change_scene_to_file("res://scenes/tishtrya_dream.tscn")
				# cant do 3 since it aint a level yet (it wont be one ever probably LOL)

func _on_body_entered(_body: Node2D) -> void:
	passedThrough = true
