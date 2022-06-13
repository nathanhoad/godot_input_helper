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