extends Area2D

@onready var camera: Node = $".."

func _on_body_entered(_body: Node2D):
	camera.offset.x += 1151.5
	queue_free()
