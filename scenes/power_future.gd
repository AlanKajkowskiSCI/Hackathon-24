extends Area2D

@export var jump_boost: float = 200.0

func _on_body_entered(body: Node2D) -> void:
	body.jump_height -= jump_boost
	queue_free()
