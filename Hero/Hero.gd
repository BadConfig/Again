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
	}
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
