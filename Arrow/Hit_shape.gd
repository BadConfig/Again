extends CollisionShape2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hit_area_area_entered(area):
	var my_object = get_parent().get_parent()
	var collide_object = area.get_parent().get_parent()
	if collide_object.name == "Enemy":
		if my_object.get_parent().name == "Hero":
			collide_object.enemy_options['human_options']['heal_points'] -= my_object.get_parent().hero_options['human_options']['damage']
			if collide_object.enemy_options['human_options']['heal_points'] <= 0:
				collide_object.get_node("Human").die()
	if collide_object.name == "Hero":
		if my_object.get_parent().name == "Enemy":
			collide_object.human_options['human_options']['heal_points'] -= my_object.get_parent().human_options['human_options']['damage']
			if collide_object.human_options['human_options']['heal_points'] <= 0:
				collide_object.get_node("Human").die()
	get_parent().get_parent().queue_free()
		