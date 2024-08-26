#!/bin/bash

# get color
color=$(hyprpicker --no-fancy)

# copy to clipboard
wl-copy "${color}"

# notify
dunstify "Color Picker" "\"${color}\" copied to clipboard"

