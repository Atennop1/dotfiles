#!/bin/bash

vpn_line=$(nmcli con show --active | grep -i tun)

if [ -n "$vpn_line" ]; then
    vpn_name=$(echo "$vpn_line" | awk '{print $1}')
    echo "VPN: On"
    echo
    echo "#00FF00"
else
    echo "VPN: Off"
    echo
    echo "#FF0000"
fi
