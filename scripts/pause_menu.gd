extends Control

func _ready():
	visible = false

func _physics_process(_delta: float) -> void:
	epicPause()

func epicPause():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()
func pause():
	get_tree().paused = true
	visible = true

func resume():
	get_tree().paused = false
	visible = false

func _on_continue_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	match randi_range(1,2):
		1: get_tree().change_scene_to_file("res://scenes/tutorial_dream_sequence.tscn")
		2: get_tree().change_scene_to_file("res://scenes/tishtrya_dream.tscn")

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
