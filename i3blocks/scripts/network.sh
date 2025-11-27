#!/bin/bash

wifi_connected=$(nmcli -t -f DEVICE,TYPE,STATE dev | grep ":wifi:connected")
eth_connected=$(nmcli -t -f DEVICE,TYPE,STATE dev | grep ":ethernet:connected")

if [ -n "$wifi_connected" ]; then
    wifi=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d: -f2)
    echo "Connection: $wifi"
    echo
    echo "#00FF00"
elif [ -n "$eth_connected" ]; then
    echo "Connection: Ethernet"
    echo
    echo "#00BFFF"
else
    echo "Connection: None"
    echo
    echo "#FF0000"
fi
