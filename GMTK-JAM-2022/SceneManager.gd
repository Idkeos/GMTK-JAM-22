extends Node

var loaded_scene_instance
var overworld # Only retain Overworld in memory

export var overworld_name = "Overworld"
var battle_screen_name = "BattleScreen"

func _init():
	overworld = load("res://" + overworld_name + ".tscn")
	loaded_scene_instance = overworld.instance()
	add_child(loaded_scene_instance)

func _on_BattleManager_starting_battle():
	start_battle_screen()
	
func start_battle_screen():
	# Retains the overworld in the memory
	remove_child(loaded_scene_instance)
	var battle_screen = load("res://" + battle_screen_name + ".tscn")
	loaded_scene_instance = battle_screen.instance()
	add_child(loaded_scene_instance)
	
func exit_battle_screen():
	# Doesn't retain the battle screen in the memory
	pass
