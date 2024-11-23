extends CharacterBody2D

var countdown_fx = preload("res://scenes/countdown_fx.tscn")
var time_stop_cooldown_fx = preload("res://scenes/time_stop_cooldown_fx.tscn")

@onready var sprite: Node = $AnimatedSprite2D
@onready var camera: Node = get_parent().get_node("Camera2D")
@onready var countdown_player: Node = $CountdownPlayer
@onready var time_stop_timer: Node = $TimeStopTimer
@onready var time_stop_cooldown: Node = $TimeStopCooldown

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
	
	if Input.is_action_just_pressed("time_stop_toggle") and time_stop_timer.time_left == 0 and time_stop_cooldown.time_left == 0:
		Global.time_stop = true
		countdown_player.play("countdown")
		time_stop_timer.start()
		
		global_position.x = 8200
		global_position.y = 200
		
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
		
	if global_position.x > 9340:
		camera.offset.x = lerp(camera.offset.x, 10650.0, 0.2)
		camera.offset.y = lerp(camera.offset.y, -150.0, 0.2)
	if global_position.x > 8064:
		camera.offset.x = lerp(camera.offset.x, 8200.0, 0.2)
		camera.offset.y = lerp(camera.offset.y, -150.0, 0.2)
	elif global_position.x > 2300:
		camera.offset.x = lerp(camera.offset.x, global_position.x - 200, 0.2)
	elif global_position.x > 1150:
		camera.offset.x = lerp(camera.offset.x, 1150.0, 0.2)
	else:
		camera.offset.x = lerp(camera.offset.x, 0.0, 0.2)
		camera.offset.y = lerp(camera.offset.y, 0.0, 0.2)

func _on_time_stop_timer_timeout():
	Global.time_stop = false
	
	var instance = time_stop_cooldown_fx.instantiate()
	instance.global_position.y -= 100
	
	add_child(instance)
	
	time_stop_cooldown.start()
