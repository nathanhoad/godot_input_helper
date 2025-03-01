extends AbstractTest


const SERIALIZED_INPUT_SNAPSHOT = '{"map":{"ui_accept":"key:Enter;mouse:1;joypad:1","ui_cancel":"key:Escape","ui_copy":"key:C|ctrl;key:Insert|ctrl","ui_cut":"key:X|ctrl;key:Delete|shift","ui_down":"key:Down;joypad:12;joypad:1|1.000000","ui_end":"key:End","ui_filedialog_refresh":"key:F5","ui_filedialog_show_hidden":"key:H","ui_filedialog_up_one_level":"key:Backspace","ui_focus_next":"key:Tab","ui_focus_prev":"key:Tab|shift","ui_graph_delete":"key:Delete","ui_graph_duplicate":"key:D|ctrl","ui_home":"key:Home","ui_left":"key:Left;joypad:13;joypad:0|-1.000000","ui_menu":"key:Menu","ui_page_down":"key:PageDown","ui_page_up":"key:PageUp","ui_paste":"key:V|ctrl;key:Insert|shift","ui_redo":"key:Z|shift,ctrl;key:Y|ctrl","ui_right":"key:Right;joypad:14;joypad:0|1.000000","ui_select":"joypad:3;key:Space","ui_swap_input_direction":"key:QuoteLeft|ctrl","ui_test_empty":"","ui_text_add_selection_for_next_occurrence":"key:D|ctrl","ui_text_backspace":"key:Backspace;key:Backspace|shift","ui_text_backspace_all_to_left":"","ui_text_backspace_all_to_left.macos":"key:Backspace|ctrl","ui_text_backspace_word":"key:Backspace|ctrl","ui_text_backspace_word.macos":"key:Backspace|alt","ui_text_caret_add_above":"key:Up|shift,ctrl","ui_text_caret_add_above.macos":"key:O|shift,ctrl","ui_text_caret_add_below":"key:Down|shift,ctrl","ui_text_caret_add_below.macos":"key:L|shift,ctrl","ui_text_caret_document_end":"key:End|ctrl","ui_text_caret_document_end.macos":"key:Down|ctrl;key:End|ctrl","ui_text_caret_document_start":"key:Home|ctrl","ui_text_caret_document_start.macos":"key:Up|ctrl;key:Home|ctrl","ui_text_caret_down":"key:Down","ui_text_caret_left":"key:Left","ui_text_caret_line_end":"key:End","ui_text_caret_line_end.macos":"key:E|ctrl;key:Right|ctrl;key:End","ui_text_caret_line_start":"key:Home","ui_text_caret_line_start.macos":"key:A|ctrl;key:Left|ctrl;key:Home","ui_text_caret_page_down":"key:PageDown","ui_text_caret_page_up":"key:PageUp","ui_text_caret_right":"key:Right","ui_text_caret_up":"key:Up","ui_text_caret_word_left":"key:Left|ctrl","ui_text_caret_word_left.macos":"key:Left|alt","ui_text_caret_word_right":"key:Right|ctrl","ui_text_caret_word_right.macos":"key:Right|alt","ui_text_clear_carets_and_selection":"key:Escape","ui_text_completion_accept":"key:Tab|shift;key:Enter|shift;key:Kp Enter|shift","ui_text_completion_query":"key:Space|ctrl","ui_text_completion_replace":"key:Tab;key:Enter;key:Kp Enter","ui_text_dedent":"key:Tab|shift","ui_text_delete":"key:Delete","ui_text_delete_all_to_right":"","ui_text_delete_all_to_right.macos":"key:Delete|ctrl","ui_text_delete_word":"key:Delete|ctrl","ui_text_delete_word.macos":"key:Delete|alt","ui_text_indent":"key:Tab","ui_text_newline":"key:Enter;key:Kp Enter","ui_text_newline_above":"key:Enter|shift,ctrl;key:Kp Enter|shift,ctrl","ui_text_newline_blank":"key:Enter|ctrl;key:Kp Enter|ctrl","ui_text_scroll_down":"key:Down|ctrl","ui_text_scroll_down.macos":"key:Down|alt,ctrl","ui_text_scroll_up":"key:Up|ctrl","ui_text_scroll_up.macos":"key:Up|alt,ctrl","ui_text_select_all":"key:A|ctrl","ui_text_select_word_under_caret":"key:G|alt","ui_text_select_word_under_caret.macos":"key:G|ctrl,meta","ui_text_skip_selection_for_next_occurrence":"key:D|alt,ctrl","ui_text_submit":"key:Enter;key:Kp Enter","ui_text_toggle_insert_mode":"key:Insert","ui_undo":"key:Z|ctrl","ui_unicode_start":"key:U|shift,ctrl","ui_up":"key:Up;joypad:11;joypad:1|-1.000000"},"version":1}'
const SERIALIZED_ACCEPT_SNAPSHOT = '{"map":{"ui_accept":"key:Enter;key:Space;mouse:1"},"version":1}'
const DESERIALIZED_INPUT_SNAPSHOT = '{"map":{"ui_accept":"key:Enter;key:Space;mouse:1","ui_cancel":"key:Escape","ui_copy":"key:C|ctrl;key:Insert|ctrl","ui_cut":"key:X|ctrl;key:Delete|shift","ui_down":"key:Down;joypad:12;joypad:1|1.000000","ui_end":"key:End","ui_filedialog_refresh":"key:F5","ui_filedialog_show_hidden":"key:H","ui_filedialog_up_one_level":"key:Backspace","ui_focus_next":"key:Tab","ui_focus_prev":"key:Tab|shift","ui_graph_delete":"key:Delete","ui_graph_duplicate":"key:D|ctrl","ui_home":"key:Home","ui_left":"key:Left;joypad:13;joypad:0|-1.000000","ui_menu":"key:Menu","ui_page_down":"key:PageDown","ui_page_up":"key:PageUp","ui_paste":"key:V|ctrl;key:Insert|shift","ui_redo":"key:Z|shift,ctrl;key:Y|ctrl","ui_right":"key:Right;joypad:14;joypad:0|1.000000","ui_select":"key:Space;joypad:3","ui_swap_input_direction":"key:QuoteLeft|ctrl","ui_test_empty":"","ui_text_add_selection_for_next_occurrence":"key:D|ctrl","ui_text_backspace":"key:Backspace;key:Backspace|shift","ui_text_backspace_all_to_left":"","ui_text_backspace_all_to_left.macos":"key:Backspace|ctrl","ui_text_backspace_word":"key:Backspace|ctrl","ui_text_backspace_word.macos":"key:Backspace|alt","ui_text_caret_add_above":"key:Up|shift,ctrl","ui_text_caret_add_above.macos":"key:O|shift,ctrl","ui_text_caret_add_below":"key:Down|shift,ctrl","ui_text_caret_add_below.macos":"key:L|shift,ctrl","ui_text_caret_document_end":"key:End|ctrl","ui_text_caret_document_end.macos":"key:Down|ctrl","ui_text_caret_document_start":"key:Home|ctrl","ui_text_caret_document_start.macos":"key:Up|ctrl","ui_text_caret_down":"key:Down","ui_text_caret_left":"key:Left","ui_text_caret_line_end":"key:End","ui_text_caret_line_end.macos":"key:E|ctrl;key:Right|ctrl","ui_text_caret_line_start":"key:Home","ui_text_caret_line_start.macos":"key:A|ctrl;key:Left|ctrl","ui_text_caret_page_down":"key:PageDown","ui_text_caret_page_up":"key:PageUp","ui_text_caret_right":"key:Right","ui_text_caret_up":"key:Up","ui_text_caret_word_left":"key:Left|ctrl","ui_text_caret_word_left.macos":"key:Left|alt","ui_text_caret_word_right":"key:Right|ctrl","ui_text_caret_word_right.macos":"key:Right|alt","ui_text_clear_carets_and_selection":"key:Escape","ui_text_completion_accept":"key:Enter;key:Kp Enter","ui_text_completion_query":"key:Space|ctrl","ui_text_completion_replace":"key:Tab","ui_text_dedent":"key:Tab|shift","ui_text_delete":"key:Delete","ui_text_delete_all_to_right":"","ui_text_delete_all_to_right.macos":"key:Delete|ctrl","ui_text_delete_word":"key:Delete|ctrl","ui_text_delete_word.macos":"key:Delete|alt","ui_text_indent":"key:Tab","ui_text_newline":"key:Enter;key:Kp Enter","ui_text_newline_above":"key:Enter|shift,ctrl;key:Kp Enter|shift,ctrl","ui_text_newline_blank":"key:Enter|ctrl;key:Kp Enter|ctrl","ui_text_scroll_down":"key:Down|ctrl","ui_text_scroll_down.macos":"key:Down|alt,ctrl","ui_text_scroll_up":"key:Up|ctrl","ui_text_scroll_up.macos":"key:Up|alt,ctrl","ui_text_select_all":"key:A|ctrl","ui_text_select_word_under_caret":"key:G|alt","ui_text_select_word_under_caret.macos":"key:G|ctrl,meta","ui_text_skip_selection_for_next_occurrence":"key:D|alt,ctrl","ui_text_submit":"key:Enter;key:Kp Enter","ui_text_toggle_insert_mode":"key:Insert","ui_undo":"key:Z|ctrl","ui_unicode_start":"key:U|shift,ctrl","ui_up":"key:Up;joypad:11;joypad:1|-1.000000"},"version":1}'


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
	on_joypad_input_changed = func(_action, _input):
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
