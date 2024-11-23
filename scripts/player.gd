extends CharacterBody2D

var countdown_fx = preload("res://scenes/countdown_fx.tscn")

@onready var sprite: Node = $AnimatedSprite2D
@onready var camera: Node = get_parent().get_node("Camera2D")
@onready var countdown_player: Node = $CountdownPlayer
@onready var time_stop_timer: Node = $TimeStopTimer

var speed: float = 400
var jump_height: float = -900
var gravity: float = 2000

var time_stop: bool = false

func countdown(number: int):
	var instance = countdown_fx.instantiate()
	
	instance.global_position.y -= 100
	instance.text = str(number)
	
	add_child(instance)

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
		countdown_player.play("countdown")
		time_stop_timer.start()
		
	if not is_on_floor():
		sprite.play("jump")
	elif direction == 0:
		sprite.play("idle")
	else:
		sprite.play("walk")
		
	if direction > 0:
		sprite.flip_h = 0
	elif direction < 0:
		sprite.flip_h = 1
		
	if global_position.x > 2300:
		camera.offset.x = lerp(camera.offset.x, global_position.x - 200, 0.2)
	elif global_position.x > 1150:
		camera.offset.x = lerp(camera.offset.x, 1150.0, 0.2)
	else:
		camera.offset.x = lerp(camera.offset.x, 0.0, 0.2)

func _on_time_stop_timer_timeout():
	Global.time_stop = false
