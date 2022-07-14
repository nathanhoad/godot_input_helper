# Input Mapping

InputHelper provides a few methods for getting and setting actions.

- `InputHelper.get_action_key(action: String) -> String`

    Get the key used for a given action.

- `InputHelper.set_action_key(action: String, key: String, swap_if_taken: bool = true) -> void`

    Set the key used for a given action. This emits `action_key_changed(action, key)` for the new key (and a separate one if a clashing action was swapped).

- `InputHelper.get_action_button(action: String) -> int`

    Get the button index used for a given action.

- `InputHelper.set_action_button(action: String, button_index: int) -> void`

    Set the button used for a given action. This emits `action_button_changed(action, button_index)` for the new button (and a separate one if a clashing action was swapped).

- `InputHelper.reset_all_actions() -> void`

    Resets all actions to the game defaults. This will emit `action_button_changed` or `action_key_changed` signals for each of the actions that were reset.


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
```