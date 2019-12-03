extends Node2D

#=============================ENEMY=OPTIONS==========================
var enemy_options = {
	'human_options': {
		'human_texture'		: preload('res://Hero/Hero assets/human.png'),
		'human_scene' 		: preload('res://Human/Human.tscn'),
		'evasion'		: 0,
		'heal_points'	: 100,
		'energy_points'	: 100,
		'speed'			: 10,
		'is_range'		: false,
		'damage'		: 50
		},
	'arrow_options': {
		'arrow_speed'		: 10000,
		'arrow_texture'		: preload('res://Hero/Hero assets/fireball.png'),
		'arrow_scene' 		: preload('res://Arrow/arrow.tscn'),
		},	
	'control_options':{
		'go_up'		: KEY_W,
		'go_down'	:KEY_S,
		'go_left'	:KEY_A,
		'go_right'	:KEY_D,
		'activate'	:KEY_F,
		'attack'	:KEY_SPACE,
		},
	}
	
#=========================DICT=GETTERS============================
func get_human_options():
	return enemy_options['human_options']
func get_arrow_options():
	return enemy_options['arrow_options']
func get_enemy_options():
	return  enemy_options
func get_spells_array():
	return []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var Enemy = enemy_options['human_options']['human_scene'].instance()
	add_child(Enemy)

#===================================walk=function====================

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
