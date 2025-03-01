using Godot;
using NathanHoad;

public partial class CSharpDeviceTester : Control
{
  Label currentDevice;
  Label lastJoypad;
  RichTextLabel logger;


  public override void _Ready()
  {
    base._Ready();

    currentDevice = GetNode<Label>("%CurrentDevice");
    lastJoypad = GetNode<Label>("%LastJoypad");
    logger = GetNode<RichTextLabel>("%Logger");

    string guessedDeviceName = InputHelper.GuessDeviceName();
    currentDevice.Text = guessedDeviceName;
    WriteToLog("Initial device", guessedDeviceName, 0);

    InputHelper.DeviceChanged += (string nextDevice, int index) =>
    {
      currentDevice.Text = nextDevice;
      lastJoypad.Text = InputHelper.LastKnownJoypadDevice;
      WriteToLog("Device changed", nextDevice, index);
    };
  }

  public override void _Input(InputEvent @event)
  {
    base._Input(@event);

    if (!(@event is InputEventMouse) && @event.IsPressed())
    {
      WriteToLog($"Pressed {@event.AsText()}", InputHelper.GetDeviceFromEvent(@event), InputHelper.GetDeviceIndexFromEvent(@event), InputHelper.GetLabelForInput(@event));
    }
  }


  private void WriteToLog(string label, string device, int deviceIndex, string deviceInputButton = "")
  {
    Color color = Colors.White;
    switch (device)
    {
      case InputHelper.DEVICE_KEYBOARD:
        color = Colors.Yellow;
        break;

      case InputHelper.DEVICE_XBOX_CONTROLLER:
        color = Colors.Green;
        break;

      case InputHelper.DEVICE_PLAYSTATION_CONTROLLER:
        color = Colors.Blue;
        break;

      case InputHelper.DEVICE_SWITCH_CONTROLLER:
      case InputHelper.SUB_DEVICE_SWITCH_JOYCON_LEFT_CONTROLLER:
      case InputHelper.SUB_DEVICE_SWITCH_JOYCON_RIGHT_CONTROLLER:
        color = Colors.Red;
        break;
    }

    string printLabel = deviceInputButton == "" ? label : $"{label} ({deviceInputButton})";

    if (deviceIndex < -1)
    {
      logger.AppendText($"{printLabel}: [b][color=#{color.ToHtml(false)}]{device}[/color][/b] in slot {deviceIndex}\n");
    }
    else
    {
      logger.AppendText($"{printLabel}: [b][color=#{color.ToHtml(false)}]{device}[/color][/b]\n");
    }

    logger.ScrollToLine(logger.GetLineCount());
  }
}
