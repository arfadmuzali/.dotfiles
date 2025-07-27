#!/bin/bash

VPN_NAME="jp-free-21.protonvpn.udp"

if nmcli connection show --active | grep -q "$VPN_NAME"; then
    echo '{ "text": "", "class": "connected", "tooltip": "Japan Proton VPN" }'
else
    echo '{ "text": "", "class": "disconnected", "tooltip": "None" }'
fi
