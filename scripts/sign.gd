extends Area2D

@onready var label: Node = $ActionLabel
@onready var animation: Node = $AnimationPlayer

func _process(_delta: float):
	if has_overlapping_bodies():
		label.visible = true
		
		if Input.is_action_just_pressed("read"):
			animation.play("show")
	else:
		label.visible = false
