#!/bin/sh
# Screenshot: saves to ~/Pictures/Screenshots and copies to clipboard.
# Usage: screenshot.sh area   (select a region with the mouse)
#        screenshot.sh full   (whole screen)
dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

if [ "$1" = "area" ]; then
    region=$(slurp) || exit 0   # Esc cancels
    grim -g "$region" "$file" || exit 1
else
    grim "$file" || exit 1
fi

wl-copy < "$file"
notify-send "Screenshot saved" "$file"
