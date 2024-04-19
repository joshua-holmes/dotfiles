#!/bin/sh

if [[ $(openvpn3 sessions-list) = "No sessions available" ]]; then
    if [[ -z $1 ]]; then
        echo -e "Config name was not provided. See below for a list of available config names that you can use. To disconnect after connecting, just type \"vpn\"\n"
        echo "EXAMPLE"
        echo -e "\t$0 <config-name>\n"
        openvpn3 configs-list
        exit
    fi
    openvpn3 session-start --config "$1"
else
    active_sessions="$(openvpn3 sessions-list | rg -i 'Config name' | cut -d':' -f2 | xargs)"
    for session in $active_sessions; do
        echo "Disconnecting from session: ${session}"
        openvpn3 session-manage --disconnect --config "${session}"
    done
fi
