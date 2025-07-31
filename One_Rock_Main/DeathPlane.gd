extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	## Reload whole level
	## Should just be a failsafe once levels done, might let player fall through the world at somepoint though lol
	get_tree().reload_current_scene()
