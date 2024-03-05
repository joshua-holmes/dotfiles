#!/bin/bash

# get color
color=$(hyprpicker --no-fancy)

# copy to clipboard
wl-copy "${color}"

# notify
dunstify "\"${color}\" copied to clipboard"

