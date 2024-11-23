extends Node2D

@onready var color_rect = $Camera2D/CanvasLayer/ColorRect
@onready var clouds_bg = $ParallaxClouds

func _ready():
	$MovingObstacles/MovingObstacle2/Area2D/AnimationPlayer.seek(0.3)
	$MovingObstacles/MovingObstacle6/Area2D/AnimationPlayer.seek(0.3)
	$MovingObstacles/MovingObstacle7/Area2D/AnimationPlayer.seek(0.3)
	$MovingObstacles/MovingObstacle11/Area2D/AnimationPlayer.seek(0.1)
	$MovingObstacles/MovingObstacle12/Area2D/AnimationPlayer.seek(0.2)
	
func _process(_delta: float):
	color_rect.visible = Global.time_stop
