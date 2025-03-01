# Usage with C#

To use Input Helper with C# you just need to add a `using NathanHoad;` statement to the file and then call PascalCase versions of the methods outlined in [Devices](./Devices.md), [Mapping](./Mapping.md), and [Rumbling](./Rumbling.md).

For example, guess the currently used device name in GDScript you would call `InputHelper.guess_device_name()` but in C# it would look more like:

```csharp
using NathanHoad;
```

And then...

```csharp
string deviceName = InputHelper.GuessDeviceName();
```

## Signals

To connect signals you can use event handlers:

```CSharp
InputHelper.DeviceChanged += (string device, int deviceIndex) =>
{
  GD.Print($"Device: {device} (in slot ${deviceIndex})");
};

InputHelper.KeyboardInputChanged += (string action, InputEvent input) =>
{
  GD.Print($"Keyboard input for {action} changed.");
};

InputHelper.JoypadInputChanged += (string action, InputEvent input) =>
{
  GD.Print($"Joypad input for {action} changed.");
};

InputHelper.JoypadChanged += (int deviceIndex, bool isConnected) =>
{
  GD.Print($"Joypad in slot {deviceIndex} is ${isConnected ? "connected" : "not connected"}");
};
```
