#!/bin/bash

if [[ -z $(hyprctl monitors | rg "DP-3") ]]; then
    hyprctl keyword monitor DP-3,3440x1440@175,200x1080,auto
else
    hyprctl keyword monitor DP-3,disabled
fi
