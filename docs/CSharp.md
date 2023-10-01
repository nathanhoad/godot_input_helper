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

To connect signals you will need to attach them to `InputHelper.Instance`, like this:

```CSharp
InputHelper.Instance.Connect("device_changed", Callable.From((string device, int index) =>
{
  GD.Print($"Device: {device} (in slot ${index})");
}));
```
