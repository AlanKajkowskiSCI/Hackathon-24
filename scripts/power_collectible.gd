extends Area2D

func _on_body_entered(_body: Node2D):
	queue_free()
