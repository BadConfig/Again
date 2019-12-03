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
	#==================SET=COOLDOWN=TIMERS=======================
	if get_parent().get_spells_array().size() == 6:
		$spell1_reload.wait_time = get_parent().get_spells_array()[0]['cooldown']
		$spell2_reload.wait_time = get_parent().get_spells_array()[1]['cooldown']
		$spell3_reload.wait_time = get_parent().get_spells_array()[2]['cooldown']
		$spell4_reload.wait_time = get_parent().get_spells_array()[3]['cooldown']
		$spell5_reload.wait_time = get_parent().get_spells_array()[4]['cooldown']
		$spell6_reload.wait_time = get_parent().get_spells_array()[5]['cooldown']
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
#========================attacking==============================
var enable_attack = true
var enable_spell1 = true
var enable_spell2 = true
var enable_spell3 = true
var enable_spell4 = true
var enable_spell5 = true
var enable_spell6 = true

func go_attack(spell_scene):
	if	$attack_reload.time_left == 0:
		enable_attack = true
	if enable_attack == true:
		var spell = spell_scene.instance()
		get_parent().add_child(spell)
		enable_attack = false
		$attack_reload.start()

func go_spell1(spell_scene):
	if	$spell1_reload.time_left == 0:
		enable_spell1 = true
	if enable_spell1 == true:
		var spell = spell_scene.instance()
		get_parent().add_child(spell)
		enable_spell1 = false
		$spell1_reload.start()


func go_spell2(spell_scene):
	if	$spell2_reload.time_left == 0:
		enable_spell2 = true
	if enable_spell2 == true:
		var spell = spell_scene.instance()
		get_parent().add_child(spell)
		enable_spell2 = false
		$spell2_reload.start()

func go_spell3(spell_scene):
	if	$spell3_reload.time_left == 0:
		enable_spell3 = true
	if enable_spell2 == true:
		var spell = spell_scene.instance()
		get_parent().add_child(spell)
		enable_spell3 = false
		$spell3_reload.start()
		
func go_spell4(spell_scene):
	if	$spell4_reload.time_left == 0:
		enable_spell4 = true
	if enable_spell4 == true:
		var spell = spell_scene.instance()
		get_parent().add_child(spell)
		enable_spell4 = false
		$spell4_reload.start()

func go_spell5(spell_scene):
	if	$spell5_reload.time_left == 0:
		enable_spell5 = true
	if enable_spell5 == true:
		var spell = spell_scene.instance()
		get_parent().add_child(spell)
		enable_spell5 = false
		$spell5_reload.start()

		
func go_spell6(spell_scene):
	if	$spell6_reload.time_left == 0:
		enable_spell6 = true
	if enable_spell6 == true:
		var spell = spell_scene.instance()
		get_parent().add_child(spell)
		enable_spell6 = false
		$spell6_reload.start()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_damage(is_hero,damage):
	if is_hero:
		get_parent().enemy_options['human_options']['heal_points'] -= damage
		if get_parent().enemy_options['human_options']['heal_points'] <= 0:
			die()
	else:
		get_parent().hero_options['human_options']['heal_points'] -= damage
		if get_parent().hero_options['human_options']['heal_points'] <= 0:
			die()
		
func die():
	get_parent().queue_free()
	
func get_direction_options(speed):
	var vector = Vector2()
	var gl_pos = 0
	if human_dir == 'up':
		vector.y = -speed
		gl_pos = get_node("Vertical_arrow_position").global_position
	if human_dir == 'down':
		vector.y = speed
		gl_pos = get_node("Vertical_arrow_position").global_position
	if human_dir == 'left':
		vector.x = -speed
		gl_pos = get_node("Horizontal_arrow_position").global_position
	if human_dir == 'right':
		vector.x = speed
		gl_pos = get_node("Horizontal_arrow_position").global_position
	return {'vector':vector,'global_position':gl_pos}
		
