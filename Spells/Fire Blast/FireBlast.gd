extends KinematicBody2D

var fireblast_options = {
	'texture'	: preload('res://Spells/Fire Blast/Assets/f59eaa826d4e49f.png'),
	'speed'		: 500,
	'cooldown' 	: 3,
	}

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

var move_vector = Vector2()
func _ready():
	get_node('Sprite').set_texture(fireblast_options['texture'])
	var t = get_parent().get_node('Human').get_direction_options(fireblast_options['speed'])
	move_vector = t['vector']
	global_position = t['global_position']
func _process(delta):
	move_and_slide(move_vector)
