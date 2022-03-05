# Rumbling

```gdscript
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