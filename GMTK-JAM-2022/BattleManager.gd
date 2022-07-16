extends Node

# the player signals it is the player and battle manager receives it
# the battle manager signals when the player dies


func _on_Player_player_touching_enemy_in_overworld(enemy_battle_group_name):
	get_tree().change_scene("res://BattleScreen.tscn")
