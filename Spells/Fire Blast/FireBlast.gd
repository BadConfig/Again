extends KinematicBody2D

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

var direction_x = 0
var direction_y = 0
var options = {}

var move_vector = Vector2()
func _ready():
	var dir = get_parent().get_node("Human").human_dir
	if dir == 'up':
		move_vector.y = -100
		global_position = get_parent().get_node("Human").get_node("Vertical_arrow_position").global_position
	if dir == 'down':
		move_vector.y = 100
		global_position = get_parent().get_node("Human").get_node("Vertical_arrow_position").global_position
	if dir == 'left':
		move_vector.x = -100
		global_position = get_parent().get_node("Human").get_node("Horizontal_arrow_position").global_position
	if dir == 'right':
		move_vector.x = 100
		global_position = get_parent().get_node("Human").get_node("Horizontal_arrow_position").global_position
	
func _process(delta):
	move_and_slide(move_vector)
