extends CharacterBody2D

##Note: this started as a builtin GODOT template but has been moddified

signal restart_level;
signal equip;
signal unequip;

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var rock_equipable: bool = false;
var rock_equiped: bool = false;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if rock_equiped:
			if Input.is_action_just_pressed("rock_action"):
				rock_equiped = false;
				emit_signal("unequip");
	else:
		if Input.is_action_just_pressed("rock_action") and rock_equipable:
			rock_equiped = true;
			emit_signal("equip");
	

	
	# Handle Jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

func die():
	emit_signal("restart_level");

func _on_hurt_detected(body):
	## seperate from die() to enable immunity effects in future
	die();


func rock_detected(body):
	rock_equipable = true;
	print("Rock in range");


func rock_exited(area):
	rock_equipable = false;
	print("Rock out of range");
