class_name mouseCaptureComponent extends Node
@export var debug: bool = false
@export_category("Mouse Capture Settings")
@export var currentMouseMode : Input.MouseMode = Input.MOUSE_MODE_CAPTURED
@export var mouseSensitivity : Vector2 = Vector2(0.005,0.005)
#@export var mouseSensitivity : float = 0.005

@export_category("Refrences")
@export var camera_controller : cameraController

var _captureMouse :bool
var _mouseInput : Vector2


func _unhandled_input(event: InputEvent) -> void:
	_captureMouse = event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	
	if _captureMouse:
		_mouseInput -= event.get_screen_relative() * mouseSensitivity
		#_mouseInput.y += -event.screen.relative.y * mouseSensitivity
	
	if debug:
		print(_mouseInput)


func _ready() -> void:
	Input.mouse_mode = currentMouseMode


func _process(delta: float) -> void:
	camera_controller.update_camera_rotation(_mouseInput)
	_mouseInput = Vector2.ZERO
