hyprx="alsa_output.usb-HP__Inc_HyperX_Cloud_II_Wireless_0-00.stereo-fallback"
external_speaker="alsa_output.pci-0000_0b_00.4.analog-stereo"

if [[ $(pactl get-default-sink) = "${hyprx}" ]]; then
    pactl set-default-sink "${external_speaker}"
    dunstify "PulseAudio" "Set to external speaker"
else
    pactl set-default-sink "${hyprx}"
    dunstify "PulseAudio" "Set to headphones"
fi
