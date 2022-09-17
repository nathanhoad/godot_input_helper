extends Control


onready var current_device: Label = $Margin/VBox/Center/VBox/CurrentDevice
onready var logger: RichTextLabel = $Margin/VBox/Logger


func _ready() -> void:
	var guessed_device_name = InputHelper.guess_device_name()
	current_device.text = guessed_device_name
	write_to_log("Initial device", guessed_device_name, 0)
	
	InputHelper.connect("device_changed", self, "_on_device_changed")


func write_to_log(label: String, device: String, device_index: int) -> void:
	var color = Color.white
	match device:
		InputHelper.DEVICE_KEYBOARD:
			color = Color.yellow
		InputHelper.DEVICE_XBOX_CONTROLLER:
			color = Color.green
		InputHelper.DEVICE_PLAYSTATION_CONTROLLER:
			color = Color.blue
		InputHelper.DEVICE_SWITCH_CONTROLLER:
			color = Color.red
	
	if device_index > -1:
		logger.append_bbcode("%s: [b][color=#%s]%s[/color][/b] in slot %s\n" % [label, color.to_html(false), device, device_index])
	else:
		logger.append_bbcode("%s: [b][color=#%s]%s[/color][/b]\n" % [label, color.to_html(false), device])


### Signals


func _on_device_changed(next_device, index):
	current_device.text = next_device
	write_to_log("Device changed", next_device, index)
