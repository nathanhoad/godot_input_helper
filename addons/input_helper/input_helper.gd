extends Node


signal device_changed(device: String, device_index: int)
signal action_key_changed(action_name: String, key: String)
signal action_button_changed(action_name: String, button: JoyButton)
signal action_mouse_changed(action_name: String, button: MouseButton)
signal gamepad_changed(device_index: int, is_connected: bool)


const DEVICE_KEYBOARD = "keyboard"
const DEVICE_XBOX_CONTROLLER = "xbox"
const DEVICE_SWITCH_CONTROLLER = "switch"
const DEVICE_SWITCH_JOYCON_LEFT_CONTROLLER = "switch_left_joycon"
const DEVICE_SWITCH_JOYCON_RIGHT_CONTROLLER = "switch_right_joycon"
const DEVICE_PLAYSTATION_CONTROLLER = "playstation"
const DEVICE_GENERIC = "generic"


@onready var device: String = guess_device_name()

var deadzone: float = 0.5
var device_index: int = -1
var device_last_changed_at: int = 0


func _ready() -> void:
	Input.joy_connection_changed.connect(func(device_index, is_connected): gamepad_changed.emit(device_index, is_connected))


func _input(event: InputEvent) -> void:
	var next_device: String = device
	var next_device_index: int = device_index

	# Did we just press a key on the keyboard?
	if event is InputEventKey:
		next_device = DEVICE_KEYBOARD
		next_device_index = -1

	# Did we just use a gamepad?
	elif event is InputEventJoypadButton \
		or (event is InputEventJoypadMotion and event.axis_value > deadzone):
		next_device = get_simplified_device_name(Input.get_joy_name(event.device))
		next_device_index = event.device

	# Debounce changes because some gamepads register twice in Windows for some reason
	var not_changed_just_then = Engine.get_frames_drawn() - device_last_changed_at > Engine.get_frames_per_second()
	if (next_device != device or next_device_index != device_index) and not_changed_just_then:
		device_last_changed_at = Engine.get_frames_drawn()

		device = next_device
		device_index = next_device_index
		device_changed.emit(device, device_index)


# Convert a Godot device identifier to a simplified string
func get_simplified_device_name(raw_name: String) -> String:
	match raw_name:
		"XInput Gamepad", "Xbox Series Controller", "Xbox 360 Controller", \
		"Xbox One Controller":
			return DEVICE_XBOX_CONTROLLER

		"Sony DualSense", "PS5 Controller", "PS4 Controller", \
		"Nacon Revolution Unlimited Pro Controller":
			return DEVICE_PLAYSTATION_CONTROLLER

		"Switch":
			return DEVICE_SWITCH_CONTROLLER
		"Joy-Con (L)":
			return DEVICE_SWITCH_JOYCON_LEFT_CONTROLLER
		"Joy-Con (R)":
			return DEVICE_SWITCH_JOYCON_RIGHT_CONTROLLER

		_:
			return DEVICE_GENERIC


# Check if there is a connected gamepad
func has_gamepad() -> bool:
	return Input.get_connected_joypads().size() > 0


# Guess the initial input device
func guess_device_name() -> String:
	if has_gamepad():
		return get_simplified_device_name(Input.get_joy_name(0))
	else:
		return DEVICE_KEYBOARD


# Set the key or button for an action
func set_action_key_or_button(action: String, event: InputEvent) -> void:
	if event is InputEventKey:
		set_action_key(action, OS.get_keycode_string(event.physical_keycode))
	elif event is InputEventJoypadButton:
		set_action_button(action, event.button_index)


# Get the key or button for a given action depending on the current device
func get_action_key_or_button(action: String) -> String:
	if device == DEVICE_KEYBOARD:
		return get_action_key(action)
	else:
		return str(get_action_button(action))


### Mapping


func reset_all_actions() -> void:
	InputMap.load_from_project_settings()
	for action in InputMap.get_actions():
		action_button_changed.emit(action, get_action_button(action))
		action_key_changed.emit(action, get_action_key(action))


func is_valid_key(key: String) -> bool:
	if key.length() == 1: return true
	if key in [
			"Up", "Down", "Left", "Right",
			"QuoteLeft",
			"Space", "Enter",
			"Alt", "Ctrl", "Shift", "Tab",
			"Comma", "Period",
			"Slash", "BackSlash",
			"Minus", "Equal",
			"Semicolon", "Apostrophe",
			"BracketLeft", "BracketRight",
			"BraceLeft", "BraceRight"
		]: return true

	return false


func get_action_key(action: String) -> String:
	for event in InputMap.action_get_events(action):
		if event is InputEventKey:
			if OS.get_keycode_string(event.physical_keycode):
				return OS.get_keycode_string(event.physical_keycode)
			else:
				return event.as_text()
	return ""


func set_action_key(target_action: String, key: String, swap_if_taken: bool = true) -> Error:
	if not is_valid_key(key): return ERR_INVALID_DATA

	# Find any action that is already mapped to this key
	var clashing_action = ""
	var clashing_event
	if swap_if_taken:
		for action in InputMap.get_actions():
			for event in InputMap.action_get_events(action):
				if event is InputEventKey and OS.get_keycode_string(event.physical_keycode) == key:
					clashing_action = action
					clashing_event = event

	# Find the key based event for the target action
	for event in InputMap.action_get_events(target_action):
		if event is InputEventKey:
			# Add the current mapping to the clashing action
			if clashing_action:
				InputMap.action_erase_event(clashing_action, clashing_event)
				InputMap.action_add_event(clashing_action, event)
				action_key_changed.emit(clashing_action, OS.get_keycode_string(event.physical_keycode))
			# Remove the current mapping
			InputMap.action_erase_event(target_action, event)

	# Add the new event to the target action
	var next_event = InputEventKey.new()
	next_event.physical_keycode = OS.find_keycode_from_string(key)
	InputMap.action_add_event(target_action, next_event)
	action_key_changed.emit(target_action, OS.get_keycode_string(next_event.physical_keycode))
	return OK


func get_action_button(action: String) -> JoyButton:
	# Get the first button input
	for event in InputMap.action_get_events(action):
		if event is InputEventJoypadButton:
			return event.button_index
	return JOY_BUTTON_INVALID


func set_action_button(target_action: String, button: JoyButton, swap_if_taken: bool = true) -> Error:
	# Find any action that is already mapped to this button
	var clashing_action = ""
	var clashing_event
	if swap_if_taken:
		for action in InputMap.get_actions():
			for event in InputMap.action_get_events(action):
				if event is InputEventJoypadButton and event.button_index == button:
					clashing_action = action
					clashing_event = event

	# Find the button based event for the target action
	for event in InputMap.action_get_events(target_action):
		if event is InputEventJoypadButton:
			# Add the current mapping to the clashing action
			if clashing_action:
				InputMap.action_erase_event(clashing_action, clashing_event)
				InputMap.action_add_event(clashing_action, event)
				action_button_changed.emit(clashing_action, event.button_index)
			# Remove the current mapping
			InputMap.action_erase_event(target_action, event)

	# Add the new event to the target action
	var next_event = InputEventJoypadButton.new()
	next_event.button_index = button
	InputMap.action_add_event(target_action, next_event)
	action_button_changed.emit(target_action, next_event.button_index)
	return OK


func get_action_mouse(action: String) -> MouseButton:
	# Get the first mouse input
	for event in InputMap.action_get_events(action):
		if event is InputEventMouseButton:
			return event.button_index
	return MOUSE_BUTTON_NONE


func set_action_mouse(target_action: String, button: MouseButton, swap_if_taken: bool = true) -> Error:
	# Find any action that is already mapped to this button
	var clashing_action = ""
	var clashing_event
	if swap_if_taken:
		for action in InputMap.get_actions():
			for event in InputMap.action_get_events(action):
				if event is InputEventMouseButton and event.button_index == button:
					clashing_action = action
					clashing_event = event

	# Find the button based event for the target action
	for event in InputMap.action_get_events(target_action):
		if event is InputEventMouseButton:
			# Add the current mapping to the clashing action
			if clashing_action:
				InputMap.action_erase_event(clashing_action, clashing_event)
				InputMap.action_add_event(clashing_action, event)
				action_mouse_changed.emit(clashing_action, event.button_index)
			# Remove the current mapping
			InputMap.action_erase_event(target_action, event)

	# Add the new event to the target action
	var next_event = InputEventMouseButton.new()
	next_event.button_index = button
	InputMap.action_add_event(target_action, next_event)
	action_mouse_changed.emit(target_action, next_event.button_index)
	return OK


### Rumbling


func rumble_small(target_device: int = 0) -> void:
	Input.start_joy_vibration(target_device, 0.4, 0, 0.1)


func rumble_medium(target_device: int = 0) -> void:
	Input.start_joy_vibration(target_device, 0, 0.7, 0.1)


func rumble_large(target_device: int = 0) -> void:
	Input.start_joy_vibration(target_device, 0, 1, 0.1)


func start_rumble_small(target_device: int = 0) -> void:
	Input.start_joy_vibration(target_device, 0.4, 0, 0)


func start_rumble_medium(target_device: int = 0) -> void:
	Input.start_joy_vibration(target_device, 0, 0.7, 0)


func start_rumble_large(target_device: int = 0) -> void:
	Input.start_joy_vibration(target_device, 0, 1, 0)


func stop_rumble(target_device: int = 0) -> void:
	Input.stop_joy_vibration(target_device)
