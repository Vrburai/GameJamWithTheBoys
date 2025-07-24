extends CharacterBody2D

@onready
##var collider = get_node("/root/Testbed_1/Rock/CollisionShape2D"); ## Currently unused, needed if and only if collider is scaled seperately
var size: int = 1;

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func check_if_valid_size(scale_factor):
	## Allowed sizes are hardcoded
	if 1 == scale_factor or 2 == scale_factor or 4 == scale_factor:
		return true;
	return false;

func decrease_size():
	## Cut size in half if allowed
	if check_if_valid_size(size/2):
		size/=2;
		
		scale = Vector2(size, size); 
		## collider.scale = Vector2(size, size);

func increase_size():
	## Un-Cut size in half if allowed
	if check_if_valid_size(size*2):
		size*=2;
		
		scale = Vector2(size, size); 
		## collider.scale = Vector2(size, size);


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	## Size up call
	if Input.is_action_just_pressed("Size_Up"):
		increase_size();
		
	## Down up call
	if Input.is_action_just_pressed("Size_Down"):
		decrease_size();
		
	move_and_slide()
	



# Called when the node enters the scene tree for the first time.
func _ready():
	pass;
#	InputMap.add_action("Size_Up");
#	var size_Up_Event = InputEventKey.new();
#	size_Up_Event.scancode = KEY_E;
#	InputMap.action_add_event("Size_Up", size_Up_Event);

# Called every frame. 'delta' is the elapsed time since the previous frame.
"""
func _process(delta):
	print("hi");
	scale = Vector2(2, 2); 
	collider.scale = Vector2(2, 2);
"""
