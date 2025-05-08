#!/bin/bash
#  ____                               _           _    
# / ___|  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_  
# \___ \ / __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __| 
#  ___) | (__| | |  __/  __/ | | \__ \ | | | (_) | |_  
# |____/ \___|_|  \___|\___|_| |_|___/_| |_|\___/ \__| 
#                                                      
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option1="Selected area"
option2="Fullscreen"
options="${option1}\n${option2}"

waitOption1="Instant"
waitOption2="Wait 3 seconds"
waitOptions="${waitOption1}\n${waitOption2}"

choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-screenshot.rasi -i -no-show-icons -l 2 -width 30 -p "Take Screenshot")

waitChoice=$(echo -e "$waitOptions" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-screenshot.rasi -i -no-show-icons -l 2 -width 30 -p "Wait interval")

case $waitChoice in
    $waitOption2)
        sleep 3
    ;;
esac

case $choice in
    $option1)
        grim -g "$(slurp)" - | swappy -f -
        notify-send "Screenshot created" "Mode: Selected area"
    ;;
    $option2)
        grim - | swappy -f -
        notify-send "Screenshot created" "Mode: Fullscreen"
    ;;
esac
