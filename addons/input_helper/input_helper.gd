extends Node


signal device_changed(device: String, device_index: int)
signal keyboard_input_changed(action: String, input: InputEvent)
signal joypad_input_changed(action: String, input: InputEventJoypadButton)
signal joypad_changed(device_index: int, is_connected: bool)


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
	Input.joy_connection_changed.connect(func(device_index, is_connected): joypad_changed.emit(device_index, is_connected))


func _input(event: InputEvent) -> void:
	var next_device: String = device
	var next_device_index: int = device_index

	# Did we just press a key on the keyboard?
	if event is InputEventKey:
		next_device = DEVICE_KEYBOARD
		next_device_index = -1

	# Did we just use a joypad?
	elif event is InputEventJoypadButton \
		or (event is InputEventJoypadMotion and abs(event.axis_value) > deadzone):
		next_device = get_simplified_device_name(Input.get_joy_name(event.device))
		next_device_index = event.device

	# Debounce changes because some joypads register twice in Windows for some reason
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


## Check if there is a connected joypad
func has_joypad() -> bool:
	return Input.get_connected_joypads().size() > 0


## Guess the initial input device
func guess_device_name() -> String:
	if has_joypad():
		return get_simplified_device_name(Input.get_joy_name(0))
	else:
		return DEVICE_KEYBOARD


### Mapping


func reset_all_actions() -> void:
	InputMap.load_from_project_settings()
	for action in InputMap.get_actions():
		var input: InputEvent = get_joypad_input_for_action(action)
		if input != null:
			joypad_input_changed.emit(action, input)

		input = get_keyboard_input_for_action(action)
		if input != null:
			keyboard_input_changed.emit(action, input)


## Set the key or button for an action
func set_keyboard_or_joypad_input_for_action(action: String, event: InputEvent, swap_if_taken: bool = true) -> void:
	if event is InputEventKey or event is InputEventMouse:
		set_keyboard_input_for_action(action, event, swap_if_taken)
	elif event is InputEventJoypadButton:
		set_joypad_input_for_action(action, event, swap_if_taken)


## Get the key or button for a given action depending on the current device
func get_keyboard_or_joypad_input_for_action(action: String) -> InputEvent:
	if device == DEVICE_KEYBOARD:
		return get_keyboard_input_for_action(action)
	else:
		return get_joypad_input_for_action(action)


## Get the key or button for a given action depending on the current device
func get_keyboard_or_joypad_inputs_for_action(action: String) -> Array[InputEvent]:
	if device == DEVICE_KEYBOARD:
		return get_keyboard_inputs_for_action(action)
	else:
		return get_joypad_inputs_for_action(action) as Array[InputEvent]


## Get a text label for a given input
func get_label_for_input(input: InputEvent) -> String:
	if input is InputEventKey:
		if input.physical_keycode > 0:
			return input.as_text_physical_keycode()
		elif input.keycode > 0:
			return input.as_text_keycode()
		else:
			return input.as_text()
	elif input is InputEventMouseButton:
		match input.button_index:
			MOUSE_BUTTON_LEFT:
				return "Mouse Left Button"
			MOUSE_BUTTON_MIDDLE:
				return "Mouse Middle Button"
			MOUSE_BUTTON_RIGHT:
				return "Mouse Right Button"
		return "Mouse Button %d" % input

	return input.as_text()


### Keyboard/mouse input


func is_valid_keyboard_input(input: InputEvent) -> bool:
	if input is InputEventKey:
		return input.keycode in [
			KEY_A, KEY_B, KEY_C, KEY_D, KEY_E, KEY_F, KEY_G, KEY_H, KEY_I, KEY_J, KEY_K, KEY_L,
			KEY_M, KEY_N, KEY_O, KEY_P, KEY_Q, KEY_R, KEY_S, KEY_T, KEY_U, KEY_V, KEY_W, KEY_X,
			KEY_Y, KEY_Z,

			KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9,

			KEY_KP_0, KEY_KP_1, KEY_KP_2, KEY_KP_3, KEY_KP_4, KEY_KP_5, KEY_KP_6, KEY_KP_7,
			KEY_KP_8, KEY_KP_9,
			KEY_KP_ADD, KEY_KP_DIVIDE, KEY_KP_ENTER, KEY_KP_MULTIPLY, KEY_KP_PERIOD,
			KEY_KP_SUBTRACT,

			KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT,
			KEY_QUOTELEFT,
			KEY_SPACE, KEY_ENTER,
			KEY_ALT, KEY_CTRL, KEY_SHIFT, KEY_TAB,
			KEY_COMMA, KEY_PERIOD,
			KEY_SLASH, KEY_BACKSLASH,
			KEY_MINUS, KEY_EQUAL,
			KEY_SEMICOLON, KEY_APOSTROPHE,
			KEY_BRACKETLEFT, KEY_BRACKETRIGHT,
			KEY_BRACELEFT, KEY_BRACERIGHT,
			KEY_ESCAPE
		]

	if input is InputEventMouseButton:
		return true

	return false


## Get all of the keys/mouse buttons used for an action.
func get_keyboard_inputs_for_action(action: String) -> Array[InputEvent]:
	return InputMap.action_get_events(action).filter(func(event):
		return event is InputEventKey or event is InputEventMouseButton
	)


## Get the first key for an action
func get_keyboard_input_for_action(action: String) -> InputEvent:
	var inputs: Array[InputEvent] = get_keyboard_inputs_for_action(action)
	return null if inputs.is_empty() else inputs[0]


## Set the key used for an action
func set_keyboard_input_for_action(action: String, input: InputEvent, swap_if_taken: bool = true) -> Error:
	return _update_keyboard_input_for_action(action, input, swap_if_taken, null)


## Replace a specific key with another key
func replace_keyboard_input_for_action(action: String, current_input: InputEvent, input: InputEvent, swap_if_taken: bool = true) -> Error:
	return _update_keyboard_input_for_action(action, input, swap_if_taken, current_input)


## Replace a specific key, given its index
func replace_keyboard_input_at_index(action: String, index: int, input: InputEvent, swap_if_taken: bool = true) -> Error:
	var inputs: Array[InputEvent] = get_keyboard_inputs_for_action(action)
	var replacing_input = InputEventKey.new() if (inputs.is_empty() or inputs.size() <= index) else inputs[index]
	return _update_keyboard_input_for_action(action, input, swap_if_taken, replacing_input)


func _update_keyboard_input_for_action(action: String, input: InputEvent, swap_if_taken: bool, replacing_input: InputEvent = null) -> Error:
	if not is_valid_keyboard_input(input): return ERR_INVALID_DATA

	var is_valid_keyboard_event = func(event):
		return event is InputEventKey or event is InputEventMouseButton

	return _update_input_for_action(action, input, swap_if_taken, replacing_input, is_valid_keyboard_event, keyboard_input_changed)


### Joypad input


## Get all buttons used for an action
func get_joypad_inputs_for_action(action: String) -> Array[InputEventJoypadButton]:
	var inputs: Array[InputEventJoypadButton]
	for event in InputMap.action_get_events(action):
		if event is InputEventJoypadButton:
			inputs.append(event)
	return inputs


## Get the first button for an action
func get_joypad_input_for_action(action: String) -> InputEvent:
	var buttons: Array[InputEventJoypadButton] = get_joypad_inputs_for_action(action)
	return null if buttons.is_empty() else buttons[0]


## Set the button for an action
func set_joypad_input_for_action(action: String, input: InputEventJoypadButton, swap_if_taken: bool = true) -> Error:
	return _update_joypad_input_for_action(action, input, swap_if_taken, null)


## Replace a specific button for an action
func replace_joypad_input_for_action(action: String, current_input: InputEventJoypadButton, input: InputEventJoypadButton, swap_if_taken: bool = true) -> Error:
	return _update_joypad_input_for_action(action, input, swap_if_taken, current_input)


## Replace a button, given its index
func replace_joypad_input_at_index(action: String, index: int, input: InputEventJoypadButton, swap_if_taken: bool = true) -> Error:
	var inputs: Array[InputEventJoypadButton] = get_joypad_inputs_for_action(action)
	var replacing_input = InputEventJoypadButton.new() if (inputs.is_empty() or inputs.size() <= index) else inputs[index]
	return _update_joypad_input_for_action(action, input, swap_if_taken, replacing_input)


## Set the action used for a button
func _update_joypad_input_for_action(action: String, input: InputEventJoypadButton, swap_if_taken: bool = true, replacing_input: InputEventJoypadButton = null) -> Error:
	var is_valid_keyboard_event = func(event):
		return event is InputEventJoypadButton

	return _update_input_for_action(action, input, swap_if_taken, replacing_input, is_valid_keyboard_event, joypad_input_changed)


func _update_input_for_action(action: String, input: InputEvent, swap_if_taken: bool, replacing_input: InputEvent, check_is_valid: Callable, did_change_signal: Signal) -> Error:
	# Find any action that is already mapped to this input
	var clashing_action = ""
	var clashing_event
	if swap_if_taken:
		for other_action in InputMap.get_actions():
			if other_action == action: continue

			for event in InputMap.action_get_events(other_action):
				if event.is_match(input):
					clashing_action = other_action
					clashing_event = event

	# Find the key based event for the target action
	var action_events: Array[InputEvent] = InputMap.action_get_events(action)
	var did_change: bool = false
	for i in range(0, action_events.size()):
		var event: InputEvent = action_events[i]
		if check_is_valid.call(event):
			if replacing_input != null and not event.is_match(replacing_input):
				continue

			# Remap the other event if there is a clashing one
			if clashing_action:
				_update_input_for_action(clashing_action, event, false, clashing_event, check_is_valid, did_change_signal)

			# Replace the event
			action_events[i] = input
			did_change = true
			break

	# If we were trying to replace something but didn't find it then just add it to the end
	if not did_change:
		action_events.append(input)

	# Apply the changes
	InputMap.action_erase_events(action)
	for event in action_events:
		if event != null:
			InputMap.action_add_event(action, event)

	if did_change:
		did_change_signal.emit(action, input)

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
