![Logo](logo.svg)

# Godot Input Helper

A simple input helper for the [Godot Engine](https://godotengine.org/).

Features:

- Detects what input device the player is using
- Can tell the difference between a few different gamepads
- Rumble a gamepad

## Usage

Copy the `input_helper` directory into your `res://addons/` directory.

Enable `InputHelper` in project plugins.

Connect your input indicators to the `device_changed` signal to be notified when the player uses a new input device. For example:

```
func _ready() -> void:
    InputHelper.connect("device_changed", self, "_on_input_device_changed")


func _on_input_device_changed(device: String, device_index: int) -> void:
    print("XBox? ", device == InputHelper.DEVICE_XBOX_CONTROLLER)
    print("Device index? ", device_index) # Probably 0
```

You can also try to guess the controller before any input is registered (thanks [@_was](https://github.com/was-games)):

```
InputHelper.guess_device_name() # Maybe "xbox" if you have an XBox controller plugged in
```

There are a couple of convencience methods to try and guess the key or button attached to an action:

```
# Get the key name of the first key-based input for the `ui_accept` action
InputHelper.get_key_label("ui_accept")

# Get the button index of the first gamepad-based input for the `ui_accept` action
InputHelper.get_button_index("ui_accept")
```

And a few methods for rumbling the controller:

```
# Shake the controller a little bit for 0.1s
InputHelper.rumble_small()

# Shake it a bit more aggressively for 0.1s
InputHelper.rumble_medium(device: int = 0)

# Do a full shake for 0.1s
InputHelper.rumble_large(device: int = 0)

# Start shaking a little bit
InputHelper.start_rumble_small(device: int = 0)

# Start shaking a bit more aggressively
InputHelper.start_rumble_medium(device: int = 0)

# Start shaking to the max
InputHelper.start_rumble_large(device: int = 0)

# Stop any shaking
InputHelper.stop_rumble(device: int = 0)
```

## More information

[![Watch a video about my input helper addon](video.jpg)](https://youtu.be/Ol95TwAuARs)  
_YouTube: Detecting input devices in Godot._

## Contributors

- [Nathan Hoad](https://nathanhoad.net)
- [was-games](https://www.youtube.com/channel/UC7CuKzumE33s_XazshcKMpA)

## License

Licensed under the MIT license, see `LICENSE` for more information.