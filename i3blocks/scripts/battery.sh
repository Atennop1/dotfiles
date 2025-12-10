#!/bin/bash

# getting status from files
status=$(cat /sys/class/power_supply/BAT*/status)
capacity=$(cat /sys/class/power_supply/BAT*/capacity)

# selecting color depending on status
if [ "$status" = "Charging" ]; then
    color="#00FF00"
elif [ "$capacity" -le 20 ]; then
    color="#FF0000"
elif [ "$capacity" -le 40 ]; then
    color="#FFA500"
elif [ "$capacity" -ge 80 ]; then
    color="#00BFFF"
else
    color="#FFFFFF"
fi

echo "BAT: $capacity% ($status)"
echo
echo "$color"
