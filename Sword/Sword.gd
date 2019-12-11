extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var options = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	options = get_parent().options['attack']
	var t = get_parent().get_direction_options(0)
	global_position = t['global_position']
	$Timer.wait_time = 1;
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Timer.time_left == 0:
		queue_free()
