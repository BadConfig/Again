extends KinematicBody2D



# Declare member variables here. Examples:
# var a = 2	
# var b = "text"
# Called when the node enters the scene tree for the first time.
var move_vector = Vector2()
var options = {}
func _ready():
	options = get_parent().options['attack']
	get_node("Sprite").set_texture(options['texture'])
	var t = get_parent().get_direction_options(options['speed'])
	move_vector = t['vector']
	global_position = t['global_position']
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide(move_vector)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

