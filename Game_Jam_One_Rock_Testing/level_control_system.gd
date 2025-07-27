extends Node2D

var Player;
var levels;
var opening_scene;
var cur_level;

# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node("Player_and_Rock");
	
	##List of all levels in order, must update or will not be included properly
	##All must be in tree
	levels = [get_node("Testbed_1"), get_node("Testbed_2")];
	
	##can change, scene to be played initially
	opening_scene = levels[0];
	
	##used for next level function
	cur_level = 0;
	
	##add_child(lvl2);
	
	##remove all levels
	for i in range(len(levels)):
		remove_child(levels[i]);
	
	add_child(opening_scene);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func next_level():
	remove_child(levels[cur_level]);
	cur_level += 1;
	add_child(levels[cur_level]);

func _on_button__next_level():
	next_level();
