extends CanvasLayer

func _ready():
	var battle_stats_player = get_parent().get_node("Player").get_node("BattleStats")
	battle_stats_player.connect("fighter_took_damage", self, "_on_BattleStats_fighter_took_damage")

func _on_BattleStats_fighter_took_damage(fighter, amount):
	if fighter.is_player:
		get_node("HpLabel").text = "HP " + str(fighter.hp) + "/" + str(fighter.max_hp)
