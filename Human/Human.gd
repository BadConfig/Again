extends KinematicBody2D

#class vars depends on usage
var is_range_attacker = true
var enemy_type = "mage"
var arrow_scene = preload("res://Arrow/arrow.tscn")
#remove when you make options 
#and make vars equal to options
var human_dir = "down"

#var options = get_parent().get_human_options()
#=========================move=functions=======================
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.set_texture(get_parent().get_human_options()['human_texture'])
	$attack_reload.wait_time = get_parent().get_human_options()['speed']/10
	pass # Replace with function body.
#=========================walking==============================
var move_vector = Vector2()


func go_up():
	move_vector.y = -get_parent().get_human_options()['speed']*50
	human_dir = "up"
	if sign($Vertical_arrow_position.position.y) == 1:
		$Vertical_arrow_position.position.y *= -1
	move_and_slide(move_vector)
	move_vector.y = 0
func go_down():
	move_vector.y = get_parent().get_human_options()['speed']*50
	human_dir = "down"
	if sign($Vertical_arrow_position.position.y) == -1:
		$Vertical_arrow_position.position.y *= -1
	move_and_slide(move_vector)
	move_vector.x = 0
func go_left():
	move_vector.x = -get_parent().get_human_options()['speed']*50
	human_dir = "left"
	if sign($Horizontal_arrow_position.position.x) == 1:
		$Horizontal_arrow_position.position.x *= -1
	move_and_slide(move_vector)
	move_vector.x = 0
func go_right():
	move_vector.x = get_parent().get_human_options()['speed']*50
	human_dir = "right"
	if sign($Horizontal_arrow_position.position.x) == -1:
		$Horizontal_arrow_position.position.x *= -1
	move_and_slide(move_vector)
	move_vector.x = 0
func go_stay():	
	pass
func go_spell(spell_scene):
	var spell = spell_scene.instance()
	get_parent().add_child(spell)
#========================attacking==============================
var enable_shoot = true

func go_attack():
	if get_parent().get_human_options()['is_range']:
		shoot_action()
	else:
		hit_action()
		
func hit_action():
	if $attack_reload.time_left == 0:
		enable_shoot = true
	if enable_shoot:
		var arrow = arrow_scene.instance()
		get_parent().add_child(arrow)
		if human_dir == 'up':
			arrow.direction_y = -1
			arrow.global_position = $Vertical_arrow_position.global_position
		elif human_dir == 'down':
			arrow.direction_y = 1
			arrow.global_position = $Vertical_arrow_position.global_position
		elif human_dir == 'left':
			arrow.direction_x = -1
			arrow.global_position = $Horizontal_arrow_position.global_position
		elif human_dir == 'right':
			arrow.direction_x = 1
			arrow.global_position = $Horizontal_arrow_position.global_position
		enable_shoot = false
		$attack_reload.start()

func shoot_action():
	if $attack_reload.time_left == 0:
		enable_shoot = true
	if enable_shoot:
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
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func die():
	get_parent().queue_free()
		
