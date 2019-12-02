extends Node2D
	
var hero_options = {
	'human_options': {
		'human_texture'		: preload('res://Hero/Hero assets/human.png'),
		'human_scene' 		: preload('res://Human/Human.tscn'),
		},
	'arrow_options': {
		'arrow_speed'		: 10000,
		'arrow_texture'		: preload('res://Hero/Hero assets/fireball.png'),
		},
	'evasion': 0,
	'heal_points': 100,
	'energy_points': 100,
	'speed': 10,
	'is_range': false,
	'control_options':{
		'go_up': KEY_W,
		'go_down':KEY_S,
		'go_left':KEY_A,
		'go_right':KEY_D,
		'activate':KEY_F,
		'attack':KEY_SPACE,
		},
	}
	
	
#==========================hero=controller========================================

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == hero_options['control_options']['go_up']:	
			$"Human".go_up(DELTA)
		if event.scancode == hero_options['control_options']['go_down']:
			$"Human".go_down(DELTA)
		if event.scancode == hero_options['control_options']['go_left']:
			$"Human".go_left(DELTA)
		if event.scancode == hero_options['control_options']['go_right']:
			$"Human".go_right(DELTA)
		if event.scancode == hero_options['control_options']['attack']:
			$"Human".go_attack()
			
			
#==========================may=be=deleted=========================================
func get_arrow_options():
	return hero_options['arrow_options']
func get_hero_options():
	return hero_options
func get_human_options():
	return hero_options['human_options']
#=================================================================================
var DELTA = 0
func _ready():
	var hero = hero_options['human_options']['human_scene'].instance()
	add_child(hero)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DELTA = delta
#	pass
