extends Node

signal starting_battle()

# the player signals it is the player and battle manager receives it
# the battle manager signals when the player dies

func _ready():
	var player = get_parent().get_node("SceneManager").get_node("Overworld").get_node("Player")
	player.connect("player_touching_enemy_in_overworld", self, "_on_Player_player_touching_enemy_in_overworld")

func _on_Player_player_touching_enemy_in_overworld(enemy_battle_group_name):
	emit_signal("starting_battle")
