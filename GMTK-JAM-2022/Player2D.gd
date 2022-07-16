extends KinematicBody2D

export var speed = 12

var velocity = Vector2.ZERO

func _physics_process(delta):
	move()
	check_touching_enemies()
	
func move():
	var direction = Vector2.ZERO
	
	direction.x += Input.get_axis("move_left" ,"move_right")
	direction.y += Input.get_axis("move_forward", "move_back")
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		#$Pivot.look_at(direction)
		
	#velocity.x = direction.x * speed
	#velocity.y = direction.y * speed
	velocity = direction * speed
	
	#position += velocity * delta
	velocity = move_and_slide(velocity)

func check_touching_enemies():
	for index in range(get_slide_count()):
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("enemy"):
			attack(collision.collider, 5) # temp setup
			break
			
func attack(target, amount):
	if Input.is_action_just_pressed("attack"):
		get_node("BattleStats").attack(target, amount)
