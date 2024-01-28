hyprx="alsa_output.usb-HP__Inc_HyperX_Cloud_II_Wireless_0-00.analog-stereo"
external_speaker="alsa_output.pci-0000_0a_00.4.analog-stereo"

if [[ $(pactl get-default-sink) = "${hyprx}" ]]; then
    pactl set-default-sink "${external_speaker}"
else
    pactl set-default-sink "${hyprx}"
fi
