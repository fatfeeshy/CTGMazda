extends Node2D

# texts
@onready var label: Label = $Text/Label
@onready var label_2: Label = $Text/Label2
@onready var label_3: Label = $Text/Label3
@onready var label_4: Label = $Text/Label4
@onready var label_5: Label = $Text/Label5

# timers
@onready var text1: Timer = $Text/Label/Text1
@onready var text2: Timer = $Text/Label2/Text2
@onready var text3: Timer = $Text/Label3/Text3
@onready var text4: Timer = $Text/Label4/Text4
@onready var text5: Timer = $Text/Label5/Text5
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#func handleBeginning():
	#if text1.is_stopped():
		#label.visible = false
		#label_2.visible = true
		#text2.start()
	#if text2.is_stopped():
		#label_2.visible = false
		#label_3.visible = true
		#text3.start()
	#if text3.is_stopped():
		#label_3.visible = false
		#label_4.visible = true
		#text4.start()
	#if text4.is_stopped():
		#label_4.visible = false
		#label_5.visible = true
		#text5.start()
	#if text5.is_stopped():
		#get_tree().change_scene_to_file("res://scenes/Tutorial.tscn")

#func _ready() -> void:
	#text1.start()
	#label.visible = true
	#label_2.visible = false
	#label_3.visible = false
	#label_4.visible = false
	#label_5.visible = false

func _process(delta: float) -> void:
	if !animation_player.is_playing() or Input.is_action_just_pressed("jumpKey"):
		get_tree().change_scene_to_file("res://scenes/Tutorial.tscn")
