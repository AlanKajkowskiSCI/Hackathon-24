extends Area2D

@export var jump_boost: float = 200.0

func _on_body_entered(_body: Node2D):
	if _body.name == "Player": 
		if _body.has_method("increase_jump_force"):
			_body.increase_jump_force(jump_boost)
	queue_free()
