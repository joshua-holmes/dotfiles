#!/bin/bash
set -e

if [[ -z $(pgrep -f "swww-daemon") ]]; then
    echo "'swww' is not running!"
    echo "Please run 'swww' with 'swww init'. See below for installation help:" 
    echo "https://github.com/Horus645/swww"
    exit 1
fi

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
    echo "Usage:
    $0 <dir containg images>"
    exit 1
fi

if [[ $(pgrep -f $0) != $$ ]]; then
    echo "This script is already running!"
    exit 1
fi

# Edit bellow to control the images transition
# Bigger = smoother
FPS=175

# Smaller = smoother
STEP=1

# Valid transitions are:
# simple | left | right | top | bottom | wipe | grow | center | outer | random
TYPE="grow"

# Percentage from LEFT and TOP (1.0,1.0 means right, bottom corner)
POSITION="0.854,0.977"

# This controls (in seconds) when to switch to the next image
INTERVAL=600

while true; do
    find "$1" \
    | while read -r img; do
	if [[ "$img" != "$1" ]]; then
	   echo "$((RANDOM % 1000)):$img"
	fi
    done \
    | sort -n | cut -d':' -f2- \
    | while read -r img; do
	sleep $INTERVAL
	swww img\
	    --transition-type "$TYPE"\
	    --transition-pos "$POSITION"\
	    "$img"
	done
done
