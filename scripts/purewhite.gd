extends Sprite2D

@onready var purewhite: Sprite2D = $"."

var fade_time := 1

func _ready() -> void:
	purewhite.self_modulate.a = 1

func _process(delta: float) -> void:
	if purewhite.self_modulate.a > 0:
		purewhite.self_modulate.a -= fade_time * delta
		purewhite.self_modulate.a = clamp(purewhite.self_modulate.a, 0, 1)
