# Input Mapping

InputHelper provides a few methods for getting and setting actions.

## Keyboard

- `InputHelper.get_action_keys(action: String) -> PackedStringArray`

  Get all of the keys used for an action.

- `InputHelper.get_action_key(action: String) -> String`

  Get the key used for an action.

- `InputHelper.set_action_key(action: String, key: String, swap_if_taken: bool = true) -> Error`

  Set the key used for a given action. This emits `action_key_changed(action, key)` for the new key (and a separate one if a clashing action was swapped).

- `InputHelper.replace_action_key(action: String, current_key: String, next_key: String, swap_if_taken: bool = true) -> Error`

  Set the key used for a given action where `current_key` is the currently mapped key. This emits `action_key_changed(action, key)` for the new key (and a separate one if a clashing action was swapped).

- `InputHelper.replace_action_key_at_index(action: String, index: int, next_key: String, swap_if_taken: bool = true) -> Error`

  Set the key used for a given action replacing the key at `index` (where the indexed list only contains keys used for the action). This emits `action_key_changed(action, key)` for the new key (and a separate one if a clashing action was swapped).

## Gamepad

- `InputHelper.get_action_buttons(action: String) -> Array[JoyButton]`

  Get all buttons used for an action.

- `InputHelper.get_action_button(action: String) -> JoyButton`

  Get the button used for an action.

- `InputHelper.set_action_button(action: String, button: JoyButton, swap_if_taken: bool = true) -> Error`

  Set the button used for a given action. This emits `action_button_changed(action, button_index)` for the new button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_action_button(action: String, current_button: JoyButton, next_button: JoyButton, swap_if_taken: bool = true) -> Error`

  Set the button used for a given action replacing `current_button`. This emits `action_button_changed(action, button_index)` for the new button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_action_button_at_index(action: String, index: int, next_button: JoyButton, swap_if_taken: bool = true) -> Error`

  Set the button used for a given action replacing the button at `index` (where the indexed list only contains gamepad buttons). This emits `action_button_changed(action, button_index)` for the new button (and a separate one if a clashing action was swapped).

## Mouse

- `InputHelper.get_action_mouse_buttons(action: String) -> Array[MouseButton]`

  Get all mouse buttons used for an action.

- `InputHelper.get_action_mouse_button(action: String) -> MouseButton`

  Get the mouse button used for an action.

- `InputHelper.set_action_mouse_button(action: String, button: MouseButton, swap_if_taken: bool = true) -> Error`

  Set the mouse button used for a given action. This emits `action_mouse_button_changed(action, button_index)` for the new button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_action_mouse_button(action: String, current_button: MouseButton, next_button: MouseButton, swap_if_taken: bool = true) -> Error`

  Set the mouse button used for a given action replacing `current_button`. This emits `action_mouse_button_changed(action, button_index)` for the new button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_action_mouse_button_at_index(action: String, index: int, next_button: MouseButton, swap_if_taken: bool = true) -> Error`

  Set the mouse button used for a given action replacing the button at `index` (where the indexed list only contains mouse buttons). This emits `action_mouse_button_changed(action, button_index)` for the new button (and a separate one if a clashing action was swapped).

## Reset

- `InputHelper.reset_all_actions() -> void`

  Resets all actions to the game defaults. This will emit `action_button_changed`, `action_key_changed`, `action_mouse_button_changed` signals for any actions that were reset.

## Getting input for mapping

Somewhere in your user interface you might have a popup that says "press a key or button" when remapping input. There you could have something similar to this for grabbing the next input event to map that action to:

```gdscript
func _unhandled_input(event) -> void:
	if event is InputEventKey and event.is_pressed():
		accept_event()
		InputHelper.set_action_key(action, event.as_text())

	if event is InputEventJoypadButton and event.is_pressed():
		accept_event()
		InputHelper.set_action_button(action, event.button_index)

	if event is InputEventMouseButton and event.is_pressed():
		accept_event()
		InputHelper.set_action_mouse_button(action, event.button_index)
```
