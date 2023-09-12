extends CenterContainer


@export var action_name: String = "ui_accept"

@onready var press_something_label: Label = $PressSomething
@onready var vbox := $VBox
@onready var change_button_1 := $VBox/Button1
@onready var change_button_2 := $VBox/Button2

var changing_input_index: int = false:
	set(value):
		changing_input_index = value
		if changing_input_index > -1:
			vbox.hide()
			press_something_label.show()
		else:
			vbox.show()
			press_something_label.hide()
	get:
		return changing_input_index


func _ready() -> void:
	self.changing_input_index = -1
	update_labels()


func _unhandled_input(event) -> void:
	if changing_input_index == -1: return

	if (event is InputEventKey or event is InputEventMouseButton) and event.is_pressed():
		accept_event()
		InputHelper.replace_keyboard_input_at_index(action_name, changing_input_index, event, true)
		update_labels()

		self.changing_input_index = -1


func update_labels() -> void:
	var inputs: Array = InputHelper.get_keyboard_inputs_for_action(action_name)

	change_button_1.text = "Change..."
	change_button_2.text = "Change..."

	if inputs.size() > 0:
		change_button_1.text = InputHelper.get_label_for_input(inputs[0])

	if inputs.size() > 1:
		change_button_2.text = InputHelper.get_label_for_input(inputs[1])


### Signals


func _on_button_1_pressed() -> void:
	self.changing_input_index = 0


func _on_button_2_pressed() -> void:
	self.changing_input_index = 1
