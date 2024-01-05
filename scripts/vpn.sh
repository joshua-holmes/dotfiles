#!/bin/sh

if [[ $(openvpn3 sessions-list) = "No sessions available" ]]; then
    openvpn3 session-start --config ~/vpn/josh.ovpn
else
    openvpn3 session-manage --disconnect --config ~/vpn/josh.ovpn
fi
