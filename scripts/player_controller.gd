class_name playerController extends CharacterBody3D

var _input_dir : Vector2 = Vector2.ZERO
var _movement_velocity : Vector3 = Vector3.ZERO
var speed : float = 5.0
var acceleration : float = 0.05
var deceleration : float = 0.3

func _physics_process(delta: float) -> void:
	var current_velocity :Vector2
	var direction 
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	_input_dir = Input.get_vector("move_left","move_right","move_forward","move_back")
	current_velocity = Vector2(_movement_velocity.x, _movement_velocity.z)
	direction = (transform.basis * Vector3(_input_dir.x,0,_input_dir.y)).normalized()
	
	if direction:
		current_velocity = lerp(current_velocity,Vector2(direction.x,direction.z) * speed, acceleration)
	else:
		current_velocity = current_velocity.move_toward(Vector2.ZERO, deceleration)
	
	_movement_velocity = Vector3(current_velocity.x, velocity.y, current_velocity.y)
	velocity = _movement_velocity
	
	move_and_slide()

func update_rotation(rotation_input)-> void:
	global_transform.basis = Basis.from_euler(rotation_input)
