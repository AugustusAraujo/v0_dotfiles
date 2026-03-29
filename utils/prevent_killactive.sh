#!/usr/bin/env bash

active_window_class=$(hyprctl activewindow -j | jq -r ".title")

# if [ "$active_window_class" = "Steam" ]; then
#     #echo "Coisou" >> /home/gustin/.config/hypr/close.log
#     xdotool getactivewindow windowunmap
# fi
# if [ "$active_window_class" = "Counter-Strike 2" ]; then
#     echo "Coisou" >> /home/gustin/v0_dotfiles/close.log
#     # xdotool getactivewindow windowunmap
# fi
if [ "$active_window_class" = "satty" ]; then
  ydotool key 1:1 1:0   # ESC
else
  hyprctl dispatch killactive ""
fi

