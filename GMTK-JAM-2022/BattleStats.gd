extends Node

signal fighter_took_damage(fighter, amount)
signal fighter_died(fighter)
signal attack(target, amount)

export var max_hp = 10

var is_player
var hp

func _ready():
	hp = max_hp
	is_player = get_parent().is_in_group("player")
	
func _process(delta):
	#test
	#attack(self, 100)
	pass

func take_damage(amount):
	hp -= amount
	emit_signal("fighter_took_damage", self, amount)
	if hp <= 0:
		die()
		
func die():
	# TODO
	pass
	
func attack(target, amount):
	emit_signal("attack", target, amount)

func _on_BattleStats_attack(target, amount):
	if target == self:
		take_damage(amount)
		
func is_player():
	return is_player
