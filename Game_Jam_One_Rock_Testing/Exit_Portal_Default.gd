extends Area2D

##state tracking vars
var active: bool = false;

signal next_level;

func _process(_delta):
	pass
	##check_state_change();
	##get_node("/root/LevelControlSystem").next_level.connect(Callable(self, "connected_signal"));

func check_state_change():
	print("hi");
	if active:
		print("james")
		emit_signal("next_level");

##collision handlers, don't change
func _on_area_2d_body_entered(body):
	active = true;
	check_state_change();

func _on_detector_body_exited(body):
	active = false;
	check_state_change();

func _on_detector_area_entered(area):
	active = true;
	check_state_change();

func _on_detector_area_exited(area):
	active = false;
	check_state_change();
