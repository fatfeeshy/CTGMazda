extends CharacterBody2D

const SPEED := 105.0
const JUMP := -205.0
const ACCEL := 20.0
const GRAVITY := 1000.0

var speed := SPEED
var jump := JUMP
var acceleration := ACCEL
var facing = 0
var gravity := GRAVITY

var hasWish = false # keep this non-statically typed for now, i think what imma do is just make it so that it sets
# the player's wish to a string once they enter a level, but the player always never has a wish until they r in a
# level :) i guess i dont necessarily need it 2 be false but have this as a placeholder

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	Inputs()
	HorizontalMovement()
	Gravity(delta)
	VerticalMovement()
	Animations()
	move_and_slide()

func Inputs(): # gets our inputs
	var _jumpKey = Input.is_action_pressed("jumpKey")
	var leftKey = Input.is_action_pressed("leftKey")
	var rightKey = Input.is_action_pressed("rightKey")
	
	if rightKey: facing = 1
	if leftKey: facing = -1

func HorizontalMovement():
	facing = Input.get_axis("leftKey", "rightKey") # defines that left is = -1 and right = 1
	velocity.x = move_toward(velocity.x, speed * facing, acceleration)
	# ^ formula for our speed (our velocity will equal our speed * the direction by an increment of our acceleration)

func Gravity(delta):
	if !is_on_floor():
		if velocity.y > 0:
			velocity.y += gravity * 1.5 * delta
		else:
			velocity.y += gravity * delta

func VerticalMovement():
	if is_on_floor():
		if Input.is_action_just_pressed("jumpKey"):
			velocity.y += jump

func Animations():
	# plays animations depending on what player is doing
	if velocity.x != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	# sets direction player is facing
	if facing < 0:
		animated_sprite_2d.flip_h = true
	if facing > 0:
		animated_sprite_2d.flip_h = false
