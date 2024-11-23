extends Area2D

@onready var player: Node = get_parent().get_node("Player")

func _process(delta: float):
	if Input.is_action_just_pressed("read") and has_overlapping_bodies():
		player.global_position.x = 224
		player.global_position.y = 320
