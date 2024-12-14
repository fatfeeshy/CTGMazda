extends CharacterBody2D

const SPEED := 97.5
const JUMP := -207.5
const ACCEL := 20.0
#const GRAVITY := 1000.0

var speed := SPEED
var jump := JUMP
var acceleration := ACCEL
var facing = 0
var gravity := 1000.0
var fireSpeed := 50.0
@export var WishID := 0 # 0 is nothing, 1 is atar (fire), 2 is tishtrya (grav toggle), 3 is spenta (big jump)
var GravType := 1 # odd is low grav, even is high grav
var hasDashed := false
var hasJumped := false
var CoyoteTimerStarted := false
var Lives := 3
var FinishedRegLevel := false

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var dash_sfx: AudioStreamPlayer2D = $DashSFX
@onready var footsteps: AudioStreamPlayer2D = $Footsteps
@onready var jump_sfx: AudioStreamPlayer2D = $JumpSFX
@onready var atar_dash: AnimatedSprite2D = $AtarDash
@onready var Rain: CPUParticles2D = $TishtryaRain
@onready var tishtrya_rain_sfx: AudioStreamPlayer2D = $TishtryaRainSFX
@onready var dienoise: AudioStreamPlayer2D = $dienoise

func _physics_process(delta: float) -> void:
	Inputs()
	HorizontalMovement()
	Gravity(delta)
	VerticalMovement()
	Animations()
	CoyoteTime()
	Wishes()
	move_and_slide()

func Inputs():
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
		if !coyote_timer.is_stopped(): # gravity wont have an effect during coyote time
			pass
		elif velocity.y > 0:
			velocity.y += gravity * 1.5 * delta
		else:
			velocity.y += gravity * delta

func VerticalMovement():
	if is_on_floor():
		if Input.is_action_just_pressed("jumpKey"):
			velocity.y += jump
			jump_sfx.pitch_scale = randf_range(0.95,1.05)
			jump_sfx.play()
			hasJumped = true
	if velocity.y == 0:
		hasJumped = false
		hasDashed = false
		CoyoteTimerStarted = false

func CoyoteTime():
	if !is_on_floor():
		if velocity.y > 0 and hasJumped == false and CoyoteTimerStarted == false: # if im falling
				coyote_timer.start()
				CoyoteTimerStarted = true
		if !coyote_timer.is_stopped():
			if Input.is_action_just_pressed("jumpKey"):
				jump_sfx.pitch_scale = randf_range(0.95,1.05)
				jump_sfx.play()
				velocity.y += jump # same as calling VerticalMovement()
				velocity.y = clamp(velocity.y, jump, jump)
				hasJumped = true
				coyote_timer.stop() # for good measure

func Wishes():
	if WishID == 0:
		pass
	else:
		match WishID:
			1: if Input.is_action_just_pressed("wishKey") and hasDashed == false: # ATAR FIRE GOD
					atar_dash.play()
					hasJumped = true
					hasDashed = true
					if facing > 0:
						velocity.x += 380
						velocity.x = clamp(velocity.x, 370, 370)
						velocity.y -= 200
						velocity.y = clamp(velocity.y, -200, -200)
						dash_sfx.pitch_scale = randf_range(0.95,1.05)
						dash_sfx.play()
					if facing < 0: # note to self i hate this code pls never code like this ever again thx
						velocity.x -= 380
						velocity.x = clamp(velocity.x, -370, -370)
						velocity.y -= 200
						velocity.y = clamp(velocity.y, -200, -200)
						dash_sfx.pitch_scale = randf_range(0.95,1.05)
						dash_sfx.play()
			2: if Input.is_action_just_pressed("wishKey"): # TISHTRYA RAINFALL GODDESS
				tishtrya_rain_sfx.pitch_scale = randf_range(0.95,1.05)
				tishtrya_rain_sfx.play()
				Rain.visible = true
				GravType += 1
				if GravType % 2 == 0:
					gravity = 500.0
					Rain.gravity = Vector2(0,-980)
					Rain.emission_rect_extents = Vector2(500,-250)
				else:
					gravity = 1250.0
					Rain.gravity = Vector2(0,980)
					Rain.emission_rect_extents = Vector2(500,250)
			3: if Input.is_action_just_pressed("wishKey"): # SPENTA EARTH JUMP
				if hasDashed == false: 
					hasDashed = true
					hasJumped = true
					velocity.y -= 300

func Animations():
	if velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")
	if facing < 0:
		animation.flip_h = true
	if facing > 0:
		animation.flip_h = false
	if velocity.y < 0:
		animation.play("jump")
	if velocity.y > 0:
		animation.play("fall")

func Footsteps():
	footsteps.pitch_scale = randf_range(0.95,1.05)
	footsteps.play()
