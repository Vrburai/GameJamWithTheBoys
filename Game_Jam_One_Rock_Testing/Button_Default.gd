extends StaticBody2D

#################################################################################
# Warning: Don't change this script unless properly sepperated from the default #
#             It will change every object created from said default             #
#################################################################################

## Basic Button, needs new skin

##state tracking vars
var counter: int = 0;
var active: bool = false;

func activate():
	## state tracking, don't change
	active = true;
	
	## needs custom effect here for each level
	print("Button Activated raaaaaaaah");

func deactivate():
	## state tracking, don't change
	active = false;
	
	## needs custom effect here for each level
	print("Button Deactivated");

func check_state_change():
	if counter == 0 and active:
		deactivate();
	if counter > 0 and not active:
		activate();

##collision handlers, don't change
func _on_area_2d_body_entered(body):
	counter += 1;
	check_state_change();

func _on_detector_body_exited(body):
	counter -= 1;
	check_state_change();

func _on_detector_area_entered(area):
	counter += 1;
	check_state_change();

func _on_detector_area_exited(area):
	counter -= 1;
	check_state_change();
