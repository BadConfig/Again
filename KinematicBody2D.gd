extends KinematicBody2D

#class vars depends on usage
var hero_speed = 60
var spell_list = []
var inventory_list = []
var is_range_attacker = true
var enemy_type = "mage"
var arrow_scene = preload("res://Arrow/arrow.tscn")
#remove when you make options 
#and make vars equal to options
var up_key = 'ui_up'
var down_key = 'ui_down'
var left_key = 'ui_left'
var right_key = 'ui_right'
var human_dir = "down"

#var options = get_parent().get_human_options()
#=========================move=functions=======================
func go_up():
	pass
func go_down():
	pass
func go_left():
	pass
func go_right():
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	$attack_reload.wait_time = get_parent().hero_options['speed']/10
	pass # Replace with function body.
#=========================walking==============================
var move_vector = Vector2()
var enable_shoot = true
func shoot_action():
	if $attack_reload.time_left == 0:
		enable_shoot = true
	if enable_shoot:
		if Input.is_action_pressed("ui_focus_next"):
			var arrow = arrow_scene.instance()
			get_parent().add_child(arrow)
			if human_dir == 'up':
				arrow.direction_y = -1
				arrow.position = $Vertical_arrow_position.global_position
			elif human_dir == 'down':
				arrow.direction_y = 1
				arrow.position = $Vertical_arrow_position.global_position
			elif human_dir == 'left':
				arrow.direction_x = -1
				arrow.position = $Horizontal_arrow_position.global_position
			elif human_dir == 'right':
				arrow.direction_x = 1
				arrow.position = $Horizontal_arrow_position.global_position
			enable_shoot = false
			$attack_reload.start()
	

func walk_action(delta):
	if Input.is_action_pressed(up_key):
		move_vector.y = -hero_speed
		human_dir = "up"
		if sign($Vertical_arrow_position.position.y) == 1:
			$Vertical_arrow_position.position.y *= -1
		
	elif Input.is_action_pressed(down_key):
		move_vector.y = hero_speed
		human_dir = "down"
		if sign($Vertical_arrow_position.position.y) == -1:
			$Vertical_arrow_position.position.y *= -1
	elif Input.is_action_pressed(left_key):
		move_vector.x = -hero_speed
		human_dir = "left"
		if sign($Horizontal_arrow_position.position.x) == 1:
			$Horizontal_arrow_position.position.x *= -1

	elif Input.is_action_pressed(right_key):
		move_vector.x = hero_speed
		human_dir = "right"
		if sign($Horizontal_arrow_position.position.x) == -1:
			$Horizontal_arrow_position.position.x *= -1

	else:
		move_vector.x = 0
		move_vector.y = 0
	move_and_slide(move_vector)
	attack()
func attack():
	if is_range_attacker:
		shoot_action()
		pass
		
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	walk_action(delta)
	
	
