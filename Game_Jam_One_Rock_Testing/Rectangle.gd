extends CharacterBody2D

signal rock_resized(radius);
var size: int = 1;
var base_radius = 6;

#Function to check valid size from Rock.gd
func check_if_valid_size(scale_factor):
	## Allowed sizes are hardcoded
	if 1 == scale_factor or 2 == scale_factor or 4 == scale_factor:
		return true;
	return false;
	
#Set size function from Rock.gd
func set_size(x):
	emit_signal("rock_resized", x * base_radius);
	size = x;

#Functions for increasing and decreasing size taken from Rock.gd
func decrease_size():
	## Cut size in half if allowed
	if check_if_valid_size(size/2):
		set_size(size / 2);
		
		scale = Vector2(size, size); 
		## collider.scale = Vector2(size, size);

func increase_size():
	## Un-Cut size in half if allowed
	if check_if_valid_size(size*2):
		set_size(size * 2);
		
		scale = Vector2(size, size); 
		## collider.scale = Vector2(size, size);
		
func _physics_process(delta):		
	if Input.is_action_just_pressed("Size_Up"):
		increase_size();
		
	## Down up call
	if Input.is_action_just_pressed("Size_Down"):
		decrease_size();




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
