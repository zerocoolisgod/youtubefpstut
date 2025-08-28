class_name playerController extends CharacterBody3D

func update_rotation(rotation_input)-> void:
	global_transform.basis = Basis.from_euler(rotation_input)
