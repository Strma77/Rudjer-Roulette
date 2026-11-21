extends Camera3D


var sensitivity = 0.2
@onready var game_camera: Camera3D = get_node(".")
@onready var camera_array: Array = [get_node("Camera1"), get_node("Camera2")]

var cam_index: int = 0
var next_camera: Camera3D


func _ready() -> void:
	set_camera()
	print(cam_index)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	






func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_cam"):
		change_cam_next()
	if event.is_action_pressed("prev_cam"):
		change_cam_prev()
	if event is InputEventMouseMotion:
		
		get_parent().rotate_y(deg_to_rad(-event.relative.x*sensitivity))
		game_camera.rotate_x(deg_to_rad(-event.relative.y*sensitivity))
		rotation.x=clamp(rotation.x,deg_to_rad(-40),deg_to_rad(60))
		
	
		


func set_camera():
	next_camera = camera_array[cam_index]
	game_camera.transform = next_camera.transform
	
func change_cam_next():
	if cam_index == camera_array.size() - 1:
		print("Ne moze vise. Maximum")
	else:
		cam_index += 1
		set_camera()
		print(cam_index)
	
	
func change_cam_prev():
	if cam_index == 0:
		print("Ne moze vise. Minimum.")
	else:
		cam_index -=1
		set_camera()
		print(cam_index)
		
