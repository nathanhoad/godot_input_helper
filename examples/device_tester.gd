extends Control


@onready var current_device: Label = $Margin/VBox/Center/VBox/CurrentDevice
@onready var logger: RichTextLabel = $Margin/VBox/Logger


func _ready() -> void:
	var guessed_device_name = InputHelper.guess_device_name()
	current_device.text = guessed_device_name
	write_to_log("Initial device", guessed_device_name, 0)

	InputHelper.device_changed.connect(_on_device_changed)


func _input(event: InputEvent) -> void:
	if not event is InputEventMouse and event.is_pressed():
		write_to_log("Pressed %s" % event.as_text(), InputHelper.device, InputHelper.device_index)


func write_to_log(label: String, device: String, device_index: int) -> void:
	var color = Color.WHITE
	match device:
		InputHelper.DEVICE_KEYBOARD:
			color = Color.YELLOW
		InputHelper.DEVICE_XBOX_CONTROLLER:
			color = Color.GREEN
		InputHelper.DEVICE_PLAYSTATION_CONTROLLER:
			color = Color.BLUE
		InputHelper.DEVICE_SWITCH_CONTROLLER, \
		InputHelper.DEVICE_SWITCH_JOYCON_LEFT_CONTROLLER, \
		InputHelper.DEVICE_SWITCH_JOYCON_RIGHT_CONTROLLER:
			color = Color.RED

	if device_index > -1:
		logger.append_text("%s: [b][color=#%s]%s[/color][/b] in slot %s\n" % [label, color.to_html(false), device, device_index])
	else:
		logger.append_text("%s: [b][color=#%s]%s[/color][/b]\n" % [label, color.to_html(false), device])

	logger.scroll_to_line(logger.get_line_count())


### Signals


func _on_device_changed(next_device, index):
	current_device.text = next_device
	write_to_log("Device changed", next_device, index)
