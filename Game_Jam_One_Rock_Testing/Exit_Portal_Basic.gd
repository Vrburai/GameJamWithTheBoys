extends StaticBody2D

#################################################################################
# Warning: Don't change this script unless properly sepperated from the default #
#             It will change every object created from said default             #
#################################################################################

## End portals, go to next level by default

##state tracking vars
var Player_Active: bool = false;
var Rock_Active: bool = false;

signal next_level;


func _process(_delta):
	pass
	##check_state_change();
	##get_node("/root/LevelControlSystem").next_level.connect(Callable(self, "connected_signal"));

func check_state_change():
	if Player_Active and Rock_Active:
		print("Next level called");
		emit_signal("next_level");

##collision handlers, don't change
func _on_area_2d_body_entered(body):
	Player_Active = true;
	check_state_change();

func _on_detector_body_exited(body):
	Player_Active = false;
	check_state_change();

func _on_detector_area_entered(area):
	Player_Active = true;
	check_state_change();

func _on_detector_area_exited(area):
	Player_Active = false;
	check_state_change();


##collision handlers, don't change
func _on_area_2d_body_entered_rock(body):
	Rock_Active = true;
	check_state_change();

func _on_detector_body_exited_rock(body):
	Rock_Active = false;
	check_state_change();

func _on_detector_area_entered_rock(area):
	Rock_Active = true;
	check_state_change();

func _on_detector_area_exited_rock(area):
	Rock_Active = false;
	check_state_change();
