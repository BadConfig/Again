extends Node2D
	
var hero_options = {
	'human_options': {
		'human_texture'		: preload('res://Hero/Hero assets/human.png'),
		'human_scene' 		: preload('res://Human/Human.tscn'),
		'evasion': 0,
		'heal_points': 100,
		'energy_points': 100,
		'speed': 5,
		'is_range': false,
		'damage' : 50,
		},
#	'arrow_options': {
#		'arrow_speed'		: 1000,
#		'arrow_texture'		: preload('res://Hero/Hero assets/fireball.png'),
#		'arrow_scene'		: preload('res://Arrow/arrow.tscn')
#		},	
	'arrow_options': {
		'arrow_speed'		: 1000,
		'arrow_texture'		: preload('res://Hero/Hero assets/fireball.png'),
		'arrow_scene'		: preload('res://Sword/Sword.tscn')
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
	'hero_spells': [ {
			'scene'		: preload('res://Spells/Fire Blast/FireBlast.tscn'),
			'texture'	: preload('res://Spells/Fire Blast/Assets/f59eaa826d4e49f.png'),
			'speed'		: 500,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fire Blast/FireBlast.tscn'),
			'texture'	: preload('res://Spells/Fire Blast/Assets/f59eaa826d4e49f.png'),
			'speed'		: 500,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fire Blast/FireBlast.tscn'),
			'texture'	: preload('res://Spells/Fire Blast/Assets/f59eaa826d4e49f.png'),
			'speed'		: 500,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fire Blast/FireBlast.tscn'),
			'texture'	: preload('res://Spells/Fire Blast/Assets/f59eaa826d4e49f.png'),
			'speed'		: 500,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fire Blast/FireBlast.tscn'),
			'texture'	: preload('res://Spells/Fire Blast/Assets/f59eaa826d4e49f.png'),
			'speed'		: 500,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fire Blast/FireBlast.tscn'),
			'texture'	: preload('res://Spells/Fire Blast/Assets/f59eaa826d4e49f.png'),
			'speed'		: 500,
			'cooldown' 	: 3,
			},
		],
	}
	
	
#==========================hero=controller========================================

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == hero_options['control_options']['attack']:
			$"Human".go_attack(hero_options['arrow_options']['arrow_scene'])
		if event.scancode == hero_options['control_options']['spell1']:
			$"Human".go_spell1(hero_options['hero_spells'][0]['scene'])
		if event.scancode == hero_options['control_options']['spell2']:
			$"Human".go_spell2(hero_options['hero_spells'][1]['scene'])
		if event.scancode == hero_options['control_options']['spell3']:
			$"Human".go_spell3(hero_options['hero_spells'][2]['scene'])	
		if event.scancode == hero_options['control_options']['spell4']:
			$"Human".go_spell4(hero_options['hero_spells'][3]['scene'])
		if event.scancode == hero_options['control_options']['spell5']:
			$"Human".go_spell5(hero_options['hero_spells'][4]['scene'])
		if event.scancode == hero_options['control_options']['spell6']:
			$"Human".go_spell6(hero_options['hero_spells'][5]['scene'])
#==========================may=be=deleted=========================================
func get_arrow_options():
	return hero_options['arrow_options']
func get_hero_options():
	return hero_options
func get_human_options():
	return hero_options['human_options']
func get_spells_array():
	return hero_options['hero_spells']
#=================================================================================
func _ready():
	var hero = hero_options['human_options']['human_scene'].instance()
	add_child(hero)
	hero.position = position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#=======================key=input====================================
	if Input.is_action_pressed('ui_up'):
			$"Human".go_up()
	elif Input.is_action_pressed('ui_down'):
			$"Human".go_down()
	if Input.is_action_pressed('ui_left'):
			$"Human".go_left()
	elif Input.is_action_pressed('ui_right'):
			$"Human".go_right()
	if Input.is_action_just_pressed('ui_shoot'):
			$"Human".go_attack(hero_options['arrow_options']['arrow_scene'])
	elif Input.is_action_just_pressed('ui_spell1'):
			$"Human".go_spell1(hero_options['hero_spells'][0]['scene'])
	elif Input.is_action_just_pressed('ui_spell2'):
			$"Human".go_spell2(hero_options['hero_spells'][1]['scene'])
	elif Input.is_action_just_pressed('ui_spell3'):
			$"Human".go_spell3(hero_options['hero_spells'][2]['scene'])	
	elif Input.is_action_just_pressed('ui_spell4'):
			$"Human".go_spell4(hero_options['hero_spells'][3]['scene'])
	elif Input.is_action_just_pressed('ui_spell5'):
			$"Human".go_spell5(hero_options['hero_spells'][4]['scene'])
	elif Input.is_action_just_pressed('ui_spell6'):
			$"Human".go_spell6(hero_options['hero_spells'][5]['scene'])
