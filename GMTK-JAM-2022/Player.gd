extends KinematicBody

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
			print("touched an enemy")
			# take damage or somethings
			break
