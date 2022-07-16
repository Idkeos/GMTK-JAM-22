extends Node

signal fighter_took_damage(fighter, amount)
signal fighter_died(fighter)
signal attack(fighter)

export var max_hp = 10

var is_player
var hp

func _ready():
	hp = max_hp
	is_player = get_parent().is_in_group("player")

func take_damage(amount):
	hp -= amount
	if hp <= 0:
		die()
		
func die():
	# TODO
	pass
	
func attack(target, amount):
	# TODO
	pass

func _on_BattleStats_attack(fighter, amount):
	if fighter == self:
		take_damage(amount)
