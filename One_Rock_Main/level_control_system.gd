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
	levels = [get_node("Tile_Level_Test"), get_node("Tile_Level_Parent")];
	
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
	

func reset_player():
	## put player and rock near origin. Maybe move to player node and activate with a signal to
	##	let player node decide what should happen to rock - ie, stay equiped?
	get_node("Player_and_Rock/Player").position = Vector2(0, 0);
	get_node("Player_and_Rock/Rock").position = Vector2(10, 0);

func next_level():
	print("Next Level Recieved");
	## Clear old level
	remove_child(levels[cur_level]);
	## keep count up to date
	cur_level += 1;
	## load new level
	add_child(levels[cur_level]);
	
	reset_player();

func _on_button__next_level():
	next_level();


func _on_restart_level():
	## TODO: unload and reload current level
	## or maybe not, bring up at meeting
	
	reset_player();
