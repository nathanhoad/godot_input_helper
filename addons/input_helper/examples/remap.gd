extends CenterContainer


export var action_name: String = "ui_accept"

onready var press_a_key_label := $PressAKeyLabel
onready var vbox := $VBox
onready var current_key_label := $VBox/CurrentKeyLabel
onready var change_button := $VBox/Button

var is_waiting_for_key: bool = false setget set_is_waiting_for_key


func _ready() -> void:
	update_label()
	self.is_waiting_for_key = false


func _unhandled_input(event) -> void:
	if not is_waiting_for_key: return
	
	if event is InputEventKey and event.is_pressed():
		accept_event()
		InputHelper.set_action_key(action_name, event.as_text())
		self.is_waiting_for_key = false
		update_label()


func update_label() -> void:
	current_key_label.text = "ui_accept is currently %s" % InputHelper.get_action_key(action_name)
	change_button.grab_focus()


### Setters


func set_is_waiting_for_key(next_is_waiting_for_key: bool) -> void:
	is_waiting_for_key = next_is_waiting_for_key
	if is_waiting_for_key:
		vbox.hide()
		press_a_key_label.show()
	else:
		vbox.show()
		press_a_key_label.hide()


### Signals


func _on_Button_pressed() -> void:
	self.is_waiting_for_key = true
