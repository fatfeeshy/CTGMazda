extends AnimatedSprite2D

@onready var logo: AnimatedSprite2D = $"."
@onready var dingsound: AudioStreamPlayer2D = $"../dingsound"
@onready var timer: Timer = $"../Timer"
var fade_time := 0.7

func _ready() -> void:
	logo.self_modulate.a = 0
	dingsound.play()
	timer.start()

func _process(delta: float) -> void:
	if logo.self_modulate.a < 1:
		logo.self_modulate.a += fade_time * delta
		logo.self_modulate.a = clamp(logo.self_modulate.a, 0, 1)
	if logo.self_modulate.a == 1:
		logo.play("Pop")

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
