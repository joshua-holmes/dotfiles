#  _____                 _      
# |_   _|__   __ _  __ _| | ___ 
#   | |/ _ \ / _` |/ _` | |/ _ \
#   | | (_) | (_| | (_| | |  __/
#   |_|\___/ \__, |\__, |_|\___|
#            |___/ |___/        
#  _   _       _   _  __ _           _   _                 
# | \ | | ___ | |_(_)/ _(_) ___ __ _| |_(_) ___  _ __  ___ 
# |  \| |/ _ \| __| | |_| |/ __/ _` | __| |/ _ \| '_ \/ __|
# | |\  | (_) | |_| |  _| | (_| (_| | |_| | (_) | | | \__ \
# |_| \_|\___/ \__|_|_| |_|\___\__,_|\__|_|\___/|_| |_|___/
#
# by Joshua Holmes (2025) 
# ----------------------------------------------------- 

unpause() {
    dunstctl set-paused false && dunstify "dunst" "Unpausing noties"
}
pause() {
    dunstify "dunst" "Pausing noties" && sleep 1 && dunstctl set-paused true
}

if [[ $(dunstctl get-pause-level) == 0 ]]; then
    pause
else
    unpause
fi
