extends Node


signal device_changed(device, device_index)


const DEVICE_KEYBOARD = "keyboard"
const DEVICE_XBOX_CONTROLLER = "xbox"
const DEVICE_SWITCH_CONTROLLER = "switch"
const DEVICE_PLAYSTATION_CONTROLLER = "playstation"
const DEVICE_GENERIC = "generic"


var device: String = DEVICE_GENERIC
var device_index: int = -1


func _input(event: InputEvent) -> void:
	var next_device: String = device
	var next_device_index: int = device_index
	
	# Did we just press a key on the keyboard?
	if event is InputEventKey and event.is_pressed():
		next_device = DEVICE_KEYBOARD
		next_device_index = -1
	
	# Did we just use a gamepad?
	elif (event is InputEventJoypadButton and event.is_pressed()) \
		or (event is InputEventJoypadMotion and event.axis_value > 0.1):
		next_device = get_simplified_device_name(Input.get_joy_name(event.device))
		next_device_index = event.device

	if next_device != device or next_device_index != device_index:
		device = next_device
		device_index = next_device_index
		emit_signal("device_changed", device, device_index)


func get_simplified_device_name(raw_name: String) -> String:
	match raw_name:
		"XInput Gamepad", "Xbox Series Controller", "Xbox 360 Wireless Receiver":
			return DEVICE_XBOX_CONTROLLER
		
		"PS5 Controller", "PS4 Controller", "PS3 Controller", "PS2 Controller":
			return DEVICE_PLAYSTATION_CONTROLLER
		
		"Switch":
			return DEVICE_SWITCH_CONTROLLER
		
		_:
			return DEVICE_GENERIC


func get_key_label(action_name: String) -> String:
	var inputs = InputMap.get_action_list(action_name)
	# Get the first key input
	for input in inputs:
		if input is InputEventKey:
			return input.as_text()
	
	return ""


func get_button_index(action_name: String) -> int:
	var inputs = InputMap.get_action_list(action_name)
	# Get the first button input
	for input in inputs:
		if input is InputEventJoypadButton:
			return input.button_index
	
	return -1


func guess_device_name() -> String:
	var connected_joypads = Input.get_connected_joypads()
	if connected_joypads.size() == 0:
		return DEVICE_KEYBOARD
	else:
		return get_simplified_device_name(Input.get_joy_name(0))


func rumble_small(device: int = 0) -> void:
	Input.start_joy_vibration(device, 0.4, 0, 0.1)


func rumble_medium(device: int = 0) -> void:
	Input.start_joy_vibration(device, 0, 0.7, 0.1)


func rumble_large(device: int = 0) -> void:
	Input.start_joy_vibration(device, 0, 1, 0.1)


func start_rumble_small(device: int = 0) -> void:
	Input.start_joy_vibration(device, 0.4, 0, 0)


func start_rumble_medium(device: int = 0) -> void:
	Input.start_joy_vibration(device, 0, 0.7, 0)


func start_rumble_large(device: int = 0) -> void:
	Input.start_joy_vibration(device, 0, 1, 0)


func stop_rumble(device: int = 0) -> void:
	Input.stop_joy_vibration(device)
