#!/bin/bash

# Gets monitor name and resolution
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')
resolution=$(xrandr | grep '*' | awk '{ print $1 }')
config="$HOME/.dotfiles/hyprland/hyprpaper.conf"

# Write the monitor name to the config file
sed -i "s/MONITOR/$monitor/g" "$config"

xrandr | grep ' connected' | while read -r line; do

    # Get monitor width and height in mm
    width=$(echo "$line" | awk '{print $12}' | sed 's/mm//')
    height=$(echo "$line" | awk '{print $14}' | sed 's/mm//')

    terminal_width=$((width * 2))
    terminal_height=$((height * 3))

    sed -i "s/WIDTH_X/$terminal_width/g" "$HOME/.dotfiles/hyprland/hyprland.conf"
    sed -i "s/HEIGHT_X/$terminal_height/g" "$HOME/.dotfiles/hyprland/hyprland.conf"

done
