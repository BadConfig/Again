extends Node2D
	
var hero_options = {
	'human_options': {
		'human_texture'		: preload('res://Hero/Hero assets/human.png'),
		'human_scene' 		: preload('res://Human/Human.tscn'),
		'evasion': 0,
		'heal_points': 100,
		'energy_points': 100,
		'speed': 10,
		'is_range': false,
		'damage' : 50,
		},
	'arrow_options': {
		'arrow_speed'		: 10000,
		'arrow_texture'		: preload('res://Hero/Hero assets/fireball.png'),
		},	
	'control_options':{
		'go_up': KEY_W,
		'go_down':KEY_S,
		'go_left':KEY_A,
		'go_right':KEY_D,
		'activate':KEY_F,
		'attack':KEY_SPACE,
		'spell1':KEY_1,
		'spell2':KEY_2,
		'spell3':KEY_3,
		'spell4':KEY_4,
		'spell5':KEY_5,
		'spell6':KEY_6,
		},
	'human_class': 'mage',
	'hero_inventory': [],
	'hero_spells': [
		preload("res://Spells/Fire Blast/FireBlast.tscn")
		],
	}
	
	
#==========================hero=controller========================================

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == hero_options['control_options']['go_up']:	
			$"Human".go_up()
		if event.scancode == hero_options['control_options']['go_down']:
			$"Human".go_down()
		if event.scancode == hero_options['control_options']['go_left']:
			$"Human".go_left()
		if event.scancode == hero_options['control_options']['go_right']:
			$"Human".go_right()
		if event.scancode == hero_options['control_options']['attack']:
			$"Human".go_attack()
		if event.scancode == hero_options['control_options']['spell1']:
			$"Human".go_spell(hero_options['hero_spells'][0])
			
			
#==========================may=be=deleted=========================================
func get_arrow_options():
	return hero_options['arrow_options']
func get_hero_options():
	return hero_options
func get_human_options():
	return hero_options['human_options']
#=================================================================================
func _ready():
	var hero = hero_options['human_options']['human_scene'].instance()
	add_child(hero)
	hero.position = position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
