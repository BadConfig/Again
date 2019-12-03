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


func _on_range_area_entered(area):
	var to_hit = area.get_parent().get_parent()
	var me = get_parent().get_parent().get_parent()
	if me.name == "Hero" and to_hit.name == "Enemy":
		to_hit.get_node('Human').get_damage(true,me.hero_options['human_options']['damage'])
	get_parent().get_parent().queue_free()
