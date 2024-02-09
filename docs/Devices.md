# Detecting Devices

Connect your input indicators to the `device_changed` signal to be notified when the player uses a new input device. For example:

```gdscript
func _ready() -> void:
    InputHelper.device_changed.connect(_on_input_device_changed)


func _on_input_device_changed(device: String, device_index: int) -> void:
    print("XBox? ", device == InputHelper.DEVICE_XBOX_CONTROLLER)
    print("Device index? ", device_index) # Probably 0
```

You can also try to guess the controller before any input is registered (thanks [@\_was](https://github.com/was-games)):

```gdscript
InputHelper.guess_device_name() # Maybe "xbox" if you have an XBox controller plugged in
```

To remap input, have a look at [Input Mapping](./Mapping.md).

## Device Tester

If you clone the full repository down from GitHub you will have access to the examples folder. In there you can have a look at the device tester examples to test inputs.

## Switch Joy-Cons on Windows

While Nintendo Switch Joy-Cons do connect to Windows via Bluetooth and do show up as joypads they don't seem to actually send any input events. They did work in the past so I'm not sure if it's a Windows bug or intentional.
