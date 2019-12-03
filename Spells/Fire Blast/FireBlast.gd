extends KinematicBody2D

var fireball_options = {
	'speed'		: 800,
	'cooldown' 	: 3,
	}

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

var move_vector = Vector2()
func _ready():
	var t = get_parent().get_node('Human').get_direction_options(fireball_options['speed'])
	move_vector = t['vector']
	global_position = t['global_position']
func _process(delta):
	move_and_slide(move_vector)
