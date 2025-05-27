#!/bin/sh

chosen=$(cut -d ';' -f1 ~/.config/DJ-hyprland/dotfiles/bemenu/snippets | bemenu -i -l 30 \
--tb '#282828CC' --tf '#ebdbb2' \
--fb '#1d2021CC' --ff '#ebdbb2' \
--nb '#1d2021CC' --nf '#ebdbb2' \
--hb '#3c3836CC' --hf '#b8bb26' \
--sb '#3c3836CC' --sf '#b8bb26' \
--scb '#1d2021CC' --scf '#ebdbb2' \
--ab '#1d2021CC' --af '#ebdbb2' \
-p 'djmenu' \
--single-instance \
-b | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	printf "%s" "$chosen" | wl-copy
	notify-send "'$chosen' copied to clipboard." &
fi
