extends AbstractTest


const SERIALIZED_INPUT_SNAPSHOT = '{"ui_accept":{"joypad":[1],"keyboard":["Enter"],"mouse":[1]},"ui_cancel":{"joypad":[],"keyboard":["Escape"],"mouse":[]},"ui_copy":{"joypad":[],"keyboard":["C|ctrl","Insert|ctrl"],"mouse":[]},"ui_cut":{"joypad":[],"keyboard":["X|ctrl","Delete|shift"],"mouse":[]},"ui_down":{"joypad":[12,"1|1"],"keyboard":["Down"],"mouse":[]},"ui_end":{"joypad":[],"keyboard":["End"],"mouse":[]},"ui_filedialog_refresh":{"joypad":[],"keyboard":["F5"],"mouse":[]},"ui_filedialog_show_hidden":{"joypad":[],"keyboard":["H"],"mouse":[]},"ui_filedialog_up_one_level":{"joypad":[],"keyboard":["Backspace"],"mouse":[]},"ui_focus_next":{"joypad":[],"keyboard":["Tab"],"mouse":[]},"ui_focus_prev":{"joypad":[],"keyboard":["Tab|shift"],"mouse":[]},"ui_graph_delete":{"joypad":[],"keyboard":["Delete"],"mouse":[]},"ui_graph_duplicate":{"joypad":[],"keyboard":["D|ctrl"],"mouse":[]},"ui_home":{"joypad":[],"keyboard":["Home"],"mouse":[]},"ui_left":{"joypad":[13,"0|-1"],"keyboard":["Left"],"mouse":[]},"ui_menu":{"joypad":[],"keyboard":["Menu"],"mouse":[]},"ui_page_down":{"joypad":[],"keyboard":["PageDown"],"mouse":[]},"ui_page_up":{"joypad":[],"keyboard":["PageUp"],"mouse":[]},"ui_paste":{"joypad":[],"keyboard":["V|ctrl","Insert|shift"],"mouse":[]},"ui_redo":{"joypad":[],"keyboard":["Z|shift,ctrl","Y|ctrl"],"mouse":[]},"ui_right":{"joypad":[14,"0|1"],"keyboard":["Right"],"mouse":[]},"ui_select":{"joypad":[3],"keyboard":["Space"],"mouse":[]},"ui_swap_input_direction":{"joypad":[],"keyboard":["QuoteLeft|ctrl"],"mouse":[]},"ui_test_empty":{"joypad":[],"keyboard":[],"mouse":[]},"ui_text_add_selection_for_next_occurrence":{"joypad":[],"keyboard":["D|ctrl"],"mouse":[]},"ui_text_backspace":{"joypad":[],"keyboard":["Backspace","Backspace|shift"],"mouse":[]},"ui_text_backspace_all_to_left":{"joypad":[],"keyboard":[],"mouse":[]},"ui_text_backspace_all_to_left.macos":{"joypad":[],"keyboard":["Backspace|ctrl"],"mouse":[]},"ui_text_backspace_word":{"joypad":[],"keyboard":["Backspace|ctrl"],"mouse":[]},"ui_text_backspace_word.macos":{"joypad":[],"keyboard":["Backspace|alt"],"mouse":[]},"ui_text_caret_add_above":{"joypad":[],"keyboard":["Up|shift,ctrl"],"mouse":[]},"ui_text_caret_add_above.macos":{"joypad":[],"keyboard":["O|shift,ctrl"],"mouse":[]},"ui_text_caret_add_below":{"joypad":[],"keyboard":["Down|shift,ctrl"],"mouse":[]},"ui_text_caret_add_below.macos":{"joypad":[],"keyboard":["L|shift,ctrl"],"mouse":[]},"ui_text_caret_document_end":{"joypad":[],"keyboard":["End|ctrl"],"mouse":[]},"ui_text_caret_document_end.macos":{"joypad":[],"keyboard":["Down|ctrl"],"mouse":[]},"ui_text_caret_document_start":{"joypad":[],"keyboard":["Home|ctrl"],"mouse":[]},"ui_text_caret_document_start.macos":{"joypad":[],"keyboard":["Up|ctrl"],"mouse":[]},"ui_text_caret_down":{"joypad":[],"keyboard":["Down"],"mouse":[]},"ui_text_caret_left":{"joypad":[],"keyboard":["Left"],"mouse":[]},"ui_text_caret_line_end":{"joypad":[],"keyboard":["End"],"mouse":[]},"ui_text_caret_line_end.macos":{"joypad":[],"keyboard":["E|ctrl","Right|ctrl"],"mouse":[]},"ui_text_caret_line_start":{"joypad":[],"keyboard":["Home"],"mouse":[]},"ui_text_caret_line_start.macos":{"joypad":[],"keyboard":["A|ctrl","Left|ctrl"],"mouse":[]},"ui_text_caret_page_down":{"joypad":[],"keyboard":["PageDown"],"mouse":[]},"ui_text_caret_page_up":{"joypad":[],"keyboard":["PageUp"],"mouse":[]},"ui_text_caret_right":{"joypad":[],"keyboard":["Right"],"mouse":[]},"ui_text_caret_up":{"joypad":[],"keyboard":["Up"],"mouse":[]},"ui_text_caret_word_left":{"joypad":[],"keyboard":["Left|ctrl"],"mouse":[]},"ui_text_caret_word_left.macos":{"joypad":[],"keyboard":["Left|alt"],"mouse":[]},"ui_text_caret_word_right":{"joypad":[],"keyboard":["Right|ctrl"],"mouse":[]},"ui_text_caret_word_right.macos":{"joypad":[],"keyboard":["Right|alt"],"mouse":[]},"ui_text_clear_carets_and_selection":{"joypad":[],"keyboard":["Escape"],"mouse":[]},"ui_text_completion_accept":{"joypad":[],"keyboard":["Enter","Kp Enter"],"mouse":[]},"ui_text_completion_query":{"joypad":[],"keyboard":["Space|ctrl"],"mouse":[]},"ui_text_completion_replace":{"joypad":[],"keyboard":["Tab"],"mouse":[]},"ui_text_dedent":{"joypad":[],"keyboard":["Tab|shift"],"mouse":[]},"ui_text_delete":{"joypad":[],"keyboard":["Delete"],"mouse":[]},"ui_text_delete_all_to_right":{"joypad":[],"keyboard":[],"mouse":[]},"ui_text_delete_all_to_right.macos":{"joypad":[],"keyboard":["Delete|ctrl"],"mouse":[]},"ui_text_delete_word":{"joypad":[],"keyboard":["Delete|ctrl"],"mouse":[]},"ui_text_delete_word.macos":{"joypad":[],"keyboard":["Delete|alt"],"mouse":[]},"ui_text_indent":{"joypad":[],"keyboard":["Tab"],"mouse":[]},"ui_text_newline":{"joypad":[],"keyboard":["Enter","Kp Enter"],"mouse":[]},"ui_text_newline_above":{"joypad":[],"keyboard":["Enter|shift,ctrl","Kp Enter|shift,ctrl"],"mouse":[]},"ui_text_newline_blank":{"joypad":[],"keyboard":["Enter|ctrl","Kp Enter|ctrl"],"mouse":[]},"ui_text_scroll_down":{"joypad":[],"keyboard":["Down|ctrl"],"mouse":[]},"ui_text_scroll_down.macos":{"joypad":[],"keyboard":["Down|alt,ctrl"],"mouse":[]},"ui_text_scroll_up":{"joypad":[],"keyboard":["Up|ctrl"],"mouse":[]},"ui_text_scroll_up.macos":{"joypad":[],"keyboard":["Up|alt,ctrl"],"mouse":[]},"ui_text_select_all":{"joypad":[],"keyboard":["A|ctrl"],"mouse":[]},"ui_text_select_word_under_caret":{"joypad":[],"keyboard":["G|alt"],"mouse":[]},"ui_text_select_word_under_caret.macos":{"joypad":[],"keyboard":["G|ctrl,meta"],"mouse":[]},"ui_text_submit":{"joypad":[],"keyboard":["Enter","Kp Enter"],"mouse":[]},"ui_text_toggle_insert_mode":{"joypad":[],"keyboard":["Insert"],"mouse":[]},"ui_undo":{"joypad":[],"keyboard":["Z|ctrl"],"mouse":[]},"ui_up":{"joypad":[11,"1|-1"],"keyboard":["Up"],"mouse":[]}}'
const SERIALIZED_ACCEPT_SNAPSHOT = '{"ui_accept":{"joypad":[],"keyboard":["Enter","Space"],"mouse":[1]}}'
const DESERIALIZED_INPUT_SNAPSHOT = '{"ui_accept":{"joypad":[],"keyboard":["Enter","Space"],"mouse":[1]},"ui_cancel":{"joypad":[],"keyboard":["Escape"],"mouse":[]},"ui_copy":{"joypad":[],"keyboard":["C|ctrl","Insert|ctrl"],"mouse":[]},"ui_cut":{"joypad":[],"keyboard":["X|ctrl","Delete|shift"],"mouse":[]},"ui_down":{"joypad":[12,"1|1"],"keyboard":["Down"],"mouse":[]},"ui_end":{"joypad":[],"keyboard":["End"],"mouse":[]},"ui_filedialog_refresh":{"joypad":[],"keyboard":["F5"],"mouse":[]},"ui_filedialog_show_hidden":{"joypad":[],"keyboard":["H"],"mouse":[]},"ui_filedialog_up_one_level":{"joypad":[],"keyboard":["Backspace"],"mouse":[]},"ui_focus_next":{"joypad":[],"keyboard":["Tab"],"mouse":[]},"ui_focus_prev":{"joypad":[],"keyboard":["Tab|shift"],"mouse":[]},"ui_graph_delete":{"joypad":[],"keyboard":["Delete"],"mouse":[]},"ui_graph_duplicate":{"joypad":[],"keyboard":["D|ctrl"],"mouse":[]},"ui_home":{"joypad":[],"keyboard":["Home"],"mouse":[]},"ui_left":{"joypad":[13,"0|-1"],"keyboard":["Left"],"mouse":[]},"ui_menu":{"joypad":[],"keyboard":["Menu"],"mouse":[]},"ui_page_down":{"joypad":[],"keyboard":["PageDown"],"mouse":[]},"ui_page_up":{"joypad":[],"keyboard":["PageUp"],"mouse":[]},"ui_paste":{"joypad":[],"keyboard":["V|ctrl","Insert|shift"],"mouse":[]},"ui_redo":{"joypad":[],"keyboard":["Z|shift,ctrl","Y|ctrl"],"mouse":[]},"ui_right":{"joypad":[14,"0|1"],"keyboard":["Right"],"mouse":[]},"ui_select":{"joypad":[3],"keyboard":["Space"],"mouse":[]},"ui_swap_input_direction":{"joypad":[],"keyboard":["QuoteLeft|ctrl"],"mouse":[]},"ui_test_empty":{"joypad":[],"keyboard":[],"mouse":[]},"ui_text_add_selection_for_next_occurrence":{"joypad":[],"keyboard":["D|ctrl"],"mouse":[]},"ui_text_backspace":{"joypad":[],"keyboard":["Backspace","Backspace|shift"],"mouse":[]},"ui_text_backspace_all_to_left":{"joypad":[],"keyboard":[],"mouse":[]},"ui_text_backspace_all_to_left.macos":{"joypad":[],"keyboard":["Backspace|ctrl"],"mouse":[]},"ui_text_backspace_word":{"joypad":[],"keyboard":["Backspace|ctrl"],"mouse":[]},"ui_text_backspace_word.macos":{"joypad":[],"keyboard":["Backspace|alt"],"mouse":[]},"ui_text_caret_add_above":{"joypad":[],"keyboard":["Up|shift,ctrl"],"mouse":[]},"ui_text_caret_add_above.macos":{"joypad":[],"keyboard":["O|shift,ctrl"],"mouse":[]},"ui_text_caret_add_below":{"joypad":[],"keyboard":["Down|shift,ctrl"],"mouse":[]},"ui_text_caret_add_below.macos":{"joypad":[],"keyboard":["L|shift,ctrl"],"mouse":[]},"ui_text_caret_document_end":{"joypad":[],"keyboard":["End|ctrl"],"mouse":[]},"ui_text_caret_document_end.macos":{"joypad":[],"keyboard":["Down|ctrl"],"mouse":[]},"ui_text_caret_document_start":{"joypad":[],"keyboard":["Home|ctrl"],"mouse":[]},"ui_text_caret_document_start.macos":{"joypad":[],"keyboard":["Up|ctrl"],"mouse":[]},"ui_text_caret_down":{"joypad":[],"keyboard":["Down"],"mouse":[]},"ui_text_caret_left":{"joypad":[],"keyboard":["Left"],"mouse":[]},"ui_text_caret_line_end":{"joypad":[],"keyboard":["End"],"mouse":[]},"ui_text_caret_line_end.macos":{"joypad":[],"keyboard":["E|ctrl","Right|ctrl"],"mouse":[]},"ui_text_caret_line_start":{"joypad":[],"keyboard":["Home"],"mouse":[]},"ui_text_caret_line_start.macos":{"joypad":[],"keyboard":["A|ctrl","Left|ctrl"],"mouse":[]},"ui_text_caret_page_down":{"joypad":[],"keyboard":["PageDown"],"mouse":[]},"ui_text_caret_page_up":{"joypad":[],"keyboard":["PageUp"],"mouse":[]},"ui_text_caret_right":{"joypad":[],"keyboard":["Right"],"mouse":[]},"ui_text_caret_up":{"joypad":[],"keyboard":["Up"],"mouse":[]},"ui_text_caret_word_left":{"joypad":[],"keyboard":["Left|ctrl"],"mouse":[]},"ui_text_caret_word_left.macos":{"joypad":[],"keyboard":["Left|alt"],"mouse":[]},"ui_text_caret_word_right":{"joypad":[],"keyboard":["Right|ctrl"],"mouse":[]},"ui_text_caret_word_right.macos":{"joypad":[],"keyboard":["Right|alt"],"mouse":[]},"ui_text_clear_carets_and_selection":{"joypad":[],"keyboard":["Escape"],"mouse":[]},"ui_text_completion_accept":{"joypad":[],"keyboard":["Enter","Kp Enter"],"mouse":[]},"ui_text_completion_query":{"joypad":[],"keyboard":["Space|ctrl"],"mouse":[]},"ui_text_completion_replace":{"joypad":[],"keyboard":["Tab"],"mouse":[]},"ui_text_dedent":{"joypad":[],"keyboard":["Tab|shift"],"mouse":[]},"ui_text_delete":{"joypad":[],"keyboard":["Delete"],"mouse":[]},"ui_text_delete_all_to_right":{"joypad":[],"keyboard":[],"mouse":[]},"ui_text_delete_all_to_right.macos":{"joypad":[],"keyboard":["Delete|ctrl"],"mouse":[]},"ui_text_delete_word":{"joypad":[],"keyboard":["Delete|ctrl"],"mouse":[]},"ui_text_delete_word.macos":{"joypad":[],"keyboard":["Delete|alt"],"mouse":[]},"ui_text_indent":{"joypad":[],"keyboard":["Tab"],"mouse":[]},"ui_text_newline":{"joypad":[],"keyboard":["Enter","Kp Enter"],"mouse":[]},"ui_text_newline_above":{"joypad":[],"keyboard":["Enter|shift,ctrl","Kp Enter|shift,ctrl"],"mouse":[]},"ui_text_newline_blank":{"joypad":[],"keyboard":["Enter|ctrl","Kp Enter|ctrl"],"mouse":[]},"ui_text_scroll_down":{"joypad":[],"keyboard":["Down|ctrl"],"mouse":[]},"ui_text_scroll_down.macos":{"joypad":[],"keyboard":["Down|alt,ctrl"],"mouse":[]},"ui_text_scroll_up":{"joypad":[],"keyboard":["Up|ctrl"],"mouse":[]},"ui_text_scroll_up.macos":{"joypad":[],"keyboard":["Up|alt,ctrl"],"mouse":[]},"ui_text_select_all":{"joypad":[],"keyboard":["A|ctrl"],"mouse":[]},"ui_text_select_word_under_caret":{"joypad":[],"keyboard":["G|alt"],"mouse":[]},"ui_text_select_word_under_caret.macos":{"joypad":[],"keyboard":["G|ctrl,meta"],"mouse":[]},"ui_text_submit":{"joypad":[],"keyboard":["Enter","Kp Enter"],"mouse":[]},"ui_text_toggle_insert_mode":{"joypad":[],"keyboard":["Insert"],"mouse":[]},"ui_undo":{"joypad":[],"keyboard":["Z|ctrl"],"mouse":[]},"ui_up":{"joypad":[11,"1|-1"],"keyboard":["Up"],"mouse":[]}}'


func before_each() -> void:
	InputHelper.reset_all_actions()
	InputHelper.device = InputHelper.DEVICE_KEYBOARD


func test_can_serialize_and_deserialize_inputs() -> void:
	var inputs = InputHelper.serialize_inputs_for_actions()
	assert(inputs == SERIALIZED_INPUT_SNAPSHOT, "Should match snapshot.")

	InputHelper.deserialize_inputs_for_actions(DESERIALIZED_INPUT_SNAPSHOT)
	inputs = InputHelper.serialize_inputs_for_actions()
	assert(inputs == DESERIALIZED_INPUT_SNAPSHOT, "Should match snapshot.")

	inputs = InputHelper.serialize_inputs_for_actions([&"ui_accept"])
	assert(inputs == SERIALIZED_ACCEPT_SNAPSHOT, "Should match snapshot.")


func test_can_manage_keyboard_or_joypad_input() -> void:
	var current_input = InputHelper.get_keyboard_or_joypad_input_for_action(&"ui_accept")
	assert(current_input.keycode == KEY_ENTER, "Should be the Enter key.")

	var next_input = InputEventKey.new()
	next_input.keycode = KEY_X
	InputHelper.set_keyboard_or_joypad_input_for_action(&"ui_accept", next_input)
	current_input = InputHelper.get_keyboard_or_joypad_input_for_action(&"ui_accept")
	assert(current_input.keycode == KEY_X, "Should be the X key.")

	InputHelper.device = InputHelper.DEVICE_XBOX_CONTROLLER

	current_input = InputHelper.get_keyboard_or_joypad_input_for_action(&"ui_left")
	assert(current_input.button_index == JOY_BUTTON_DPAD_LEFT, "Should be the Left button.")

	next_input = InputEventJoypadButton.new()
	next_input.button_index = JOY_BUTTON_LEFT_SHOULDER
	InputHelper.set_keyboard_or_joypad_input_for_action(&"ui_left", next_input)
	current_input = InputHelper.get_keyboard_or_joypad_input_for_action(&"ui_left")
	assert(current_input.button_index == JOY_BUTTON_LEFT_SHOULDER, "Should be the left shoulder button.")


func test_can_get_keyboard_or_joypad_inputs() -> void:
	var current_inputs = InputHelper.get_keyboard_or_joypad_inputs_for_action(&"ui_accept")
	assert(current_inputs.size() == 2, "Should have one input.")
	assert(current_inputs[0].keycode == KEY_ENTER, "Should be the Enter key.")
	assert(current_inputs[1].button_index == MOUSE_BUTTON_LEFT, "Should be the Left mouse button.")

	InputHelper.device = InputHelper.DEVICE_XBOX_CONTROLLER

	current_inputs = InputHelper.get_keyboard_or_joypad_inputs_for_action(&"ui_left")
	assert(current_inputs.size() == 2, "Should have two input.")
	assert(current_inputs[0].button_index == JOY_BUTTON_DPAD_LEFT, "Should be the Left button.")
	assert(current_inputs[1].axis == JOY_AXIS_LEFT_X, "Should be the Left button.")


func test_can_manage_keyboard_input() -> void:
	var old_input = InputHelper.get_keyboard_input_for_action(&"ui_accept")
	assert(old_input.keycode == KEY_ENTER, "Should be the Enter key.")

	var next_input = InputEventKey.new()
	next_input.keycode = KEY_X
	InputHelper.set_keyboard_input_for_action(&"ui_accept", next_input)
	next_input = InputHelper.get_keyboard_input_for_action(&"ui_accept")
	assert(next_input.keycode == KEY_X, "Should be the X key.")

	var alternative_input = InputEventMouseButton.new()
	alternative_input.button_index = MOUSE_BUTTON_MIDDLE
	InputHelper.replace_keyboard_input_at_index(&"ui_accept", 1, alternative_input)
	alternative_input = InputHelper.get_keyboard_inputs_for_action(&"ui_accept")[1]
	assert(alternative_input.button_index == MOUSE_BUTTON_MIDDLE, "Should be the Middle mouse button.")

	InputHelper.replace_keyboard_input_for_action(&"ui_accept", next_input, old_input)
	var replaced_input = InputHelper.get_keyboard_inputs_for_action(&"ui_accept")[0]
	assert(replaced_input.keycode == KEY_ENTER, "Should be the Enter key.")


func test_can_manage_joypad_input() -> void:
	var old_input = InputEventJoypadButton.new()
	old_input.button_index = JOY_BUTTON_A
	InputHelper.set_joypad_input_for_action(&"ui_accept", old_input)

	old_input = InputHelper.get_joypad_input_for_action(&"ui_accept")
	assert(old_input.button_index == JOY_BUTTON_A, "Should be the A button.")

	var next_input = InputEventJoypadButton.new()
	next_input.button_index = JOY_BUTTON_B
	InputHelper.set_joypad_input_for_action(&"ui_accept", next_input)
	next_input = InputHelper.get_joypad_input_for_action(&"ui_accept")
	assert(next_input.button_index == JOY_BUTTON_B, "Should be the B button.")

	var alternative_input = InputEventJoypadMotion.new()
	alternative_input.axis = JOY_AXIS_LEFT_X
	alternative_input.axis_value = 1
	InputHelper.replace_joypad_input_at_index(&"ui_accept", 1, alternative_input)
	alternative_input = InputHelper.get_joypad_inputs_for_action(&"ui_accept")[1]
	assert(alternative_input.axis == JOY_AXIS_LEFT_X, "Should be the Left X axis.")
	assert(alternative_input.axis_value == 1, "Should be the Left X axis value 1.")

	InputHelper.replace_joypad_input_for_action(&"ui_accept", next_input, old_input)
	var replaced_input = InputHelper.get_joypad_inputs_for_action(&"ui_accept")[0]
	assert(replaced_input.button_index == JOY_BUTTON_A, "Should be the A button.")


func test_will_emit_changed_signal() -> void:
	var empty_input = InputHelper.get_joypad_input_for_action(&"ui_test_empty")
	assert(empty_input == null, "Should be no button for ui_test_empty.")

	# We have to use a dictionary because integers pass by value
	var signal_calls: Dictionary = { count = 0 }
	var on_joypad_input_changed: Callable
	on_joypad_input_changed = func(action, input):
		signal_calls.count += 1
	InputHelper.joypad_input_changed.connect(on_joypad_input_changed)

	# Set it from nothing
	var next_input = InputEventJoypadButton.new()
	next_input.button_index = JOY_BUTTON_RIGHT_SHOULDER
	InputHelper.set_joypad_input_for_action(&"ui_test_empty", next_input)
	assert(signal_calls.count == 1, "Should have emitted signal.")

	# Replace it
	var next_next_input = InputEventJoypadButton.new()
	next_next_input.button_index = JOY_BUTTON_B
	InputHelper.set_joypad_input_for_action(&"ui_test_empty", next_next_input, false)
	assert(signal_calls.count == 2, "Should have emitted signal.")

	InputHelper.joypad_input_changed.disconnect(on_joypad_input_changed)
