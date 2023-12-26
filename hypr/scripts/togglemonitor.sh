#!/bin/bash

if [[ -z $(hyprctl monitors | rg "DP-3") ]]; then
    python ~/dotfiles/hypr/scripts/togglemonitor_script.py enable
else
    python ~/dotfiles/hypr/scripts/togglemonitor_script.py disable
fi

sleep 5

if [[ -z $(ps -A | rg waybar) ]]; then
    ~/dotfiles/waybar/launch.sh
fi
