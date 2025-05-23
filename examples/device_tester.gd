extends Control


@onready var current_device: Label = %CurrentDevice
@onready var last_joypad: Label = %LastJoypad
@onready var logger: RichTextLabel = %Logger


func _ready() -> void:
	var guessed_device_name = InputHelper.guess_device_name()
	current_device.text = guessed_device_name
	write_to_log("Initial device", guessed_device_name, 0)

	InputHelper.device_changed.connect(_on_device_changed)


func _input(event: InputEvent) -> void:
	if not event is InputEventMouse and event.is_pressed():
		write_to_log("Pressed %s" % InputHelper.get_label_for_input(event), InputHelper.get_device_from_event(event), InputHelper.get_device_index_from_event(event), InputHelper.get_label_for_input(event))


func write_to_log(label: String, device: String, device_index: int, device_input_button: String= "") -> void:
	var color = Color.WHITE
	match device:
		InputHelper.DEVICE_KEYBOARD:
			color = Color.YELLOW
		InputHelper.DEVICE_XBOX_CONTROLLER:
			color = Color.GREEN
		InputHelper.DEVICE_PLAYSTATION_CONTROLLER:
			color = Color.BLUE
		InputHelper.DEVICE_SWITCH_CONTROLLER:
			color = Color.RED
		InputHelper.DEVICE_STEAMDECK_CONTROLLER:
			color = Color.DEEP_PINK

	var print_label = label if device_input_button == "" else "%s (%s)" % [label, device_input_button]

	if device_index > -1:
		logger.append_text("%s: [b][color=#%s]%s[/color][/b] in slot %s\n" % [print_label, color.to_html(false), device, device_index])
	else:
		logger.append_text("%s: [b][color=#%s]%s[/color][/b]\n" % [print_label, color.to_html(false), device])

	logger.scroll_to_line(logger.get_line_count())


### Signals


func _on_device_changed(next_device, index):
	current_device.text = next_device
	last_joypad.text = InputHelper.last_known_joypad_device
	write_to_log("Device changed", next_device, index)
