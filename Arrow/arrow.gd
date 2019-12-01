extends KinematicBody2D



# Declare member variables here. Examples:
# var a = 2	
# var b = "text"
# Called when the node enters the scene tree for the first time.
var direction_x = 0
var direction_y = 0
var options = {}


func _ready():
	options = get_parent().get_arrow_options()
	get_node("Sprite").set_texture(options['arrow_texture'])
	
var move_vector = Vector2()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_vector.x = options['arrow_speed']*delta*direction_x
	move_vector.y = options['arrow_speed']*delta*direction_y
	move_and_slide(move_vector)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
