hyprx="alsa_output.usb-Kingston_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo"
external_speaker="alsa_output.pci-0000_0a_00.4.analog-stereo"

if [[ $(pactl get-default-sink) = "${hyprx}" ]]; then
    pactl set-default-sink "${external_speaker}"
else
    pactl set-default-sink "${hyprx}"
fi
