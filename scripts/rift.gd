extends Area2D

@onready var label: Node = $ActionLabel
@onready var player: Node = get_parent().get_node("Player")

func _process(delta: float):
	if has_overlapping_bodies():
		label.visible = true
		
		if Input.is_action_just_pressed("read"):
			get_tree().change_scene_to_file("res://scenes/future.tscn")
	else:
		label.visible = false
