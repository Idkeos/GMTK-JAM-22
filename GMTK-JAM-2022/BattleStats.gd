extends Node

signal new_fighter(fighter, is_player)
signal fighter_took_damage(fighter, amount)
signal fighter_died(fighter)
signal attack(fighter)

export var max_hp = 10
export var is_player = false
var hp

func _ready():
	hp = max_hp
	emit_signal("new_fighter", self, is_player)

func take_damage(amount):
	hp -= amount
	print("dsj")
	if hp <= 0:
		die()
		
func die():
	emit_signal("fighter_died", self)
	
func attack(target, amount):
	emit_signal("attack", target, amount)

func _on_BattleStats_attack(fighter, amount):
	if fighter == self:
		take_damage(amount)
