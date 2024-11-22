extends CharacterBody2D

var speed: float = 400
var jump_height: float = -900
var gravity: float = 2000

func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	var direction = Input.get_axis("left", "right")
	
	velocity.x = direction * speed
	
	move_and_slide()
