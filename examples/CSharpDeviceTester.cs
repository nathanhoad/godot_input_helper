using Godot;
using NathanHoad;

public partial class CSharpDeviceTester : Control
{
  Label currentDevice;
  RichTextLabel logger;


  public override void _Ready()
  {
    base._Ready();

    currentDevice = GetNode<Label>("Margin/VBox/Center/VBox/CurrentDevice");
    logger = GetNode<RichTextLabel>("Margin/VBox/Logger");

    string guessedDeviceName = InputHelper.GuessDeviceName();
    currentDevice.Text = guessedDeviceName;
    WriteToLog("Initial device", guessedDeviceName, 0);

    InputHelper.Instance.Connect("device_changed", Callable.From((string nextDevice, int index) =>
    {
      currentDevice.Text = nextDevice;
      WriteToLog("Device changed", nextDevice, index);
    }));
  }


  private void WriteToLog(string label, string device, int deviceIndex)
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
      case InputHelper.DEVICE_SWITCH_JOYCON_LEFT_CONTROLLER:
      case InputHelper.DEVICE_SWITCH_JOYCON_RIGHT_CONTROLLER:
        color = Colors.Red;
        break;
    }

    if (deviceIndex < -1)
    {
      logger.AppendText($"{label}: [b][color=#{color.ToHtml(false)}]{device}[/color][/b] in slot {deviceIndex}\n");
    }
    else
    {
      logger.AppendText($"{label}: [b][color=#{color.ToHtml(false)}]{device}[/color][/b]\n");
    }

    logger.ScrollToLine(logger.GetLineCount());
  }
}
