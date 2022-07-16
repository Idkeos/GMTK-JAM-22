extends Node

signal fighter_took_damage(fighter, amount)
signal fighter_died(fighter)
signal attack(target, amount)
signal test1()

export var max_hp = 10

var is_player
var hp

func _ready(): #!!!!!1
	var playerstats # make the signal here
	var enemystats # make the signal here
	# might cause a problem that enemies can't attack each other but this shouldn't be a too big issue
	
	hp = max_hp
	is_player = get_parent().is_in_group("player")
	
#func _process(delta):
	#test
	#attack(self, 5)

func take_damage(amount):
	hp -= amount
	emit_signal("fighter_took_damage", self.get_parent(), amount)
	if hp <= 0:
		die()
		
func die():
	self.get_parent().queue_free()
	
func attack(target, amount):
	emit_signal("attack", target, amount)

func _on_BattleStats_attack(target, amount):
	#print(target)
	print(self.get_parent())
	print()
	if target == self.get_parent():
		take_damage(amount)
