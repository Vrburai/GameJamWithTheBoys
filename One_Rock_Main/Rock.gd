extends CharacterBody2D

signal rock_resized(radius);

@onready
##var collider = get_node("/root/Testbed_1/Rock/CollisionShape2D"); ## Currently unused, needed if and only if collider is scaled seperately
var size: int = 1;
var equiped = false;
var base_radius = 6;

@export var snap_point: Sprite2D;
##@onready
##var snap_point = snap_points;

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func check_if_valid_size(scale_factor):
	## Allowed sizes are hardcoded
	if 1 == scale_factor or 2 == scale_factor or 4 == scale_factor:
		return true;
	return false;

func set_size(x):
	emit_signal("rock_resized", x * base_radius);
	size = x;

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
	
	if equiped:
		self.global_position.x = snap_point.global_position.x;
		self.global_position.y = snap_point.global_position.y;
		move_and_collide(Vector2(0, 0));
	else:
		# gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
		move_and_slide()
	
	
	## Size up call
	if Input.is_action_just_pressed("Size_Up"):
		increase_size();
		
	## Down up call
	if Input.is_action_just_pressed("Size_Down"):
		decrease_size();
		
	if $CollisionShape2D.disabled == true:
		## reset collision shape after flight glitch prevention
		$CollisionShape2D.disabled = false;



# Called when the node enters the scene tree for the first time.
func _ready():
	## used to force player snap points to correct distance
	set_size(size);

func _on_player_equip():
	##Stops flight glitch
	$CollisionShape2D.disabled = true;
	equiped = true;


func _on_player_unequip():
	equiped = false;
