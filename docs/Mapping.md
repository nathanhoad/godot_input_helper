# Input Mapping

InputHelper provides a few methods for getting and setting actions.

## Keyboard & Mouse

- `InputHelper.get_keyboard_inputs_for_action(action: String) -> Array[InputEvent]`

  Get all of the inputs for an action that use a keyboard or mouse.

- `InputHelper.get_keyboard_input_for_action(action: String) -> InputEvent`

  Get the primary key or mouse button used for an action.

- `InputHelper.set_keyboard_input_for_action(action: String, input: InputEvent, swap_if_taken: bool = true) -> Error`

  Set the primary key or mouse button used for a given action. This emits `keyboard_input_changed(action, event)` for the new key or mouse button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_action_key(action: String, current_input: InputEvent, input: InputEvent, swap_if_taken: bool = true) -> Error`

  Set the key or mouse button used for a given action where `current_input` is the currently mapped input event. This emits `keyboard_input_changed(action, event)` for the new key or mouse button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_keyboard_input_at_index(action: String, index: int, input: InputEvent, swap_if_taken: bool = true) -> Error`

  Set the key or mouse button used for a given action replacing the input at `index` (where the indexed list only contains keys and mouse buttons used for the action). This emits `keyboard_input_changed(action, event)` for the new key or mouse button (and a separate one if a clashing action was swapped).

## Joypad

- `InputHelper.get_joypad_inputs_for_action(action: String) -> Array[InputEvent]`

  Get all buttons used for an action.

- `InputHelper.get_joypad_input_for_action(action: String) -> InputEvent`

  Get the primary button used for an action.

- `InputHelper.set_joypad_input_for_action(action: String, input: InputEvent, swap_if_taken: bool = true) -> Error`

  Set the button used for a given action. This emits `joypad_input_changed(action, event)` for the new button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_joypad_input_for_action(action: String, current_input: InputEvent, input: InputEvent, swap_if_taken: bool = true) -> Error`

  Set the button used for a given action replacing `current_input`. This emits `joypad_input_changed(action, event)` for the new button (and a separate one if a clashing action was swapped).

- `InputHelper.replace_joypad_input_at_index(action: String, index: int, input: InputEvent, swap_if_taken: bool = true) -> Error`

  Set the button used for a given action replacing the button at `index` (where the indexed list only contains joypad buttons). This emits `joypad_input_changed(action, event)` for the new button (and a separate one if a clashing action was swapped).

## Reset

- `InputHelper.reset_all_actions() -> void`

  Resets all actions to the game defaults. This will emit `keyboard_input_changed` or `joypad_input_changed` signals for any actions that were reset.

## Getting input for mapping

Somewhere in your user interface you might have a popup that says "press a key or button" when remapping input. There you could have something similar to this for grabbing the next input event to map that action to:

```gdscript
func _unhandled_input(event) -> void:
	if (event is InputEventKey or event is InputEventMouseButton) and event.is_pressed():
		accept_event()
		InputHelper.set_keyboard_input_for_action(action, event)

	if event is InputEventJoypadButton and event.is_pressed():
		accept_event()
		InputHelper.set_joypad_input_for_action(action, event)
```

## Saving and loading input

While the actual saving and loading part is up to you to implement for your game, there are two methods that will help.

- `InputHelper.serialize_inputs_for_actions(actions: PackedStringArray = []) -> String`

  Gets all inputs for the given actions list (if left blank it will get _all_ actions in the Input Map) and returns a string that you can save with your game data.

- `InputHelper.deserialize_inputs_for_actions(serialized_string: String) -> void`

  Given a previously serialized string, it will repopulate the Input Map with the deserialized input data.
