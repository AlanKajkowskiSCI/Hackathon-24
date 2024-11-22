extends CharacterBody2D

@onready var sprite: Node = $AnimatedSprite2D

var speed: float = 400
var jump_height: float = -900
var gravity: float = 2000

var time_stop: bool = false

func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	var direction = Input.get_axis("left", "right")
	
	velocity.x = direction * speed
	
	move_and_slide()
	
	if Input.is_action_just_pressed("time_stop_toggle"):
		Global.time_stop = not Global.time_stop
		
	if not is_on_floor():
		sprite.play("jump")
	elif direction == 0:
		sprite.play("idle")
	else:
		sprite.play("walk")
		sprite.flip_h = direction < 0
