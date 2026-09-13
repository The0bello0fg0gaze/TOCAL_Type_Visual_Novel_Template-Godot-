extends CharacterBody2D

const SPEED:int = 100
@export var player_animation:AnimatedSprite2D

var last_axis_x: float = 0.0
var last_axis_y: float = 0.0


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if DataManager.movement:
		apply_movement()
	move_and_slide()


func apply_movement() -> void:
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	# Track when buttons are newly pressed to determine priority
	if Input.is_action_just_pressed("ui_left") or (left and last_axis_x == 0):
		last_axis_x = -1.0
	elif Input.is_action_just_pressed("ui_right") or (right and last_axis_x == 0):
		last_axis_x = 1.0
	elif not left and not right:
		last_axis_x = 0.0
		
	if Input.is_action_just_pressed("ui_up") or (up and last_axis_y == 0):
		last_axis_y = -1.0
	elif Input.is_action_just_pressed("ui_down") or (down and last_axis_y == 0):
		last_axis_y = 1.0
	elif not up and not down:
		last_axis_y = 0.0

	var direction := Vector2.ZERO

	   # Decide which input was pressed *last* or is active
	if last_axis_x != 0 and last_axis_y != 0:
		# If both are held, check which one was pressed more recently or default to X/Y priority
		# A simple way: whichever action's "just_pressed" happened last
		if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
			direction = Vector2(0, last_axis_y)
		else:
			direction = Vector2(last_axis_x, 0)
	elif last_axis_x != 0:
		direction = Vector2(last_axis_x, 0)
	elif last_axis_y != 0:
		direction = Vector2(0, last_axis_y)
	if direction.x:
		if direction.x == 1:
			player_animation.flip_h = false
			player_animation.play("dwn")
		else:
			player_animation.flip_h = true
			player_animation.play("dwn")
	elif direction.y:
		if direction.y == -1:
			player_animation.play("up")
		else:
			player_animation.play("dwn")
	else:
		player_animation.stop()
	velocity = direction * SPEED
