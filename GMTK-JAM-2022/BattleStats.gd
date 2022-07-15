extends Node

signal new_fighter(fighter)
signal fighter_died(fighter)
signal attack(fighter)

export var max_hp = 10
var hp

func _ready():
	hp = max_hp
	emit_signal("new_fighter", self)

func take_damage(amount):
	hp -= amount
	if hp <= 0:
		die()
		
func die():
	emit_signal("fighter_died", self)
	
func attack(target, amount):
	emit_signal("attack", target, amount)

func _on_BattleStats_attack(fighter, amount):
	if fighter == self:
		take_damage(amount)
