#!/bin/bash

directory=~/.config/dj-hyprland/dotfiles/extras/wallpapers
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

if [ -d "$directory" ]; then
    random_background=$(ls "$directory"/*.{jpg,jpeg,png} | shuf -n 1)

    # Change wallpaper
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$random_background"
    hyprctl hyprpaper wallpaper "$monitor,$random_background"

fi
