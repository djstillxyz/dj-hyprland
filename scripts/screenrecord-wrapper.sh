#!/bin/bash

# Change this to your terminal of choice: kitty, alacritty, foot, wezterm, etc.
TERMINAL="kitty"

# Path to the actual recording logic
SCRIPT_PATH="$HOME/.config/DJ-hyprland/scripts/screenrecord.sh"

# Launch a new terminal window and run the recording script inside it
$TERMINAL -e "$SCRIPT_PATH"
