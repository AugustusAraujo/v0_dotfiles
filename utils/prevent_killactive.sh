#!/usr/bin/env bash

active_window_class=$(hyprctl activewindow -j | jq -r ".title")

if [ "$active_window_class" = "satty" ]; then
  ydotool key 1:1 1:0   # ESC
else
  hyprctl dispatch killactive ""
fi