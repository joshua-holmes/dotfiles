#!/bin/bash
set -e

if [[ -z $(pgrep -f "swww-daemon") ]]; then
    echo "'swww' is not running!"
    echo "Please run 'swww' with 'swww init'. See below for installation help:" 
    echo "https://github.com/Horus645/swww"
    exit 1
fi

source "$(dirname $0)/../swww.conf" 

current_image=$(realpath $WP_IMAGES/$(swww query\
    | grep --only-matching --extended-regexp 'image: ".+"'\
    | cut --delimiter \" --fields 2\
    | uniq\
    ))

new_image=$(find "$WP_IMAGES" \
    | while read -r img; do
        if [[ "$img" != "$WP_IMAGES" && "$img" != "$current_image" ]]; then
           echo "$((RANDOM % 1000)):$img"
        fi
    done \
    | sort --numeric-sort\
    | grep --max-count 1 ""\
    | cut --delimiter ':' --fields 2-\
    )

swww img\
    --transition-type "$TYPE"\
    --transition-pos "$POSITION"\
    --transition-step "$STEP"\
    --transition-fps "$FPS"\
    "$new_image"

