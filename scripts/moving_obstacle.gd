extends Node2D

@onready var animation: Node = $Area2D/AnimationPlayer 

func _process(_delta: float):
	animation.speed_scale = int(not Global.time_stop)

func _on_area_2d_body_entered(body: Node):
	body.kill()
