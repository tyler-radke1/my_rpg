extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO  # Start with no movement

	# Check input for movement
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalize direction to prevent diagonal speed boost
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Set velocity and move
	velocity = direction * SPEED
	move_and_slide()
