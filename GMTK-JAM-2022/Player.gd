extends KinematicBody

signal player_touching_enemy_in_overworld(enemy_battle_group_name)

export var speed = 12

var velocity = Vector3.ZERO

func _physics_process(delta):
	move()
	check_touching_enemies()
	
func move():
	var direction = Vector3.ZERO
	
	direction.x += Input.get_axis("move_left" ,"move_right")
	direction.z += Input.get_axis("move_forward", "move_back")
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
		
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	velocity = move_and_slide(velocity, Vector3.UP)

func check_touching_enemies():
	for index in range(get_slide_count()):
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("enemy"):
			var enemy_group_name = collision.collider.get_enemy_battle_group_name()
			collision.collider.queue_free()
			emit_signal("player_touching_enemy_in_overworld", enemy_group_name)
			break
