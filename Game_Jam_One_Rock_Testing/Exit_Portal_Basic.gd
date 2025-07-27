extends StaticBody2D

#################################################################################
# Warning: Don't change this script unless properly sepperated from the default #
#             It will change every object created from said default             #
#################################################################################

## End portals, go to next level by default

##state tracking vars
var active: bool = false;

signal next_level;

func _process(_delta):
	pass
	##check_state_change();
	##get_node("/root/LevelControlSystem").next_level.connect(Callable(self, "connected_signal"));

func check_state_change():
	if active:
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

