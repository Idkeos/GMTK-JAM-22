extends Node

func _ready():
	var player_stats = get_parent().get_parent().get_node("BattleManager").get_node("PlayerStats")
	player_stats.connect("fighter_took_damage", self, "_on_PlayerStats_fighter_took_damage")
	

func _on_PlayerStats_fighter_took_damage(fighter, amount):
	print("ssss")
	# TODO, make update HP counter when attack test button created
	
func player_attack(attack_Id):
	pass
