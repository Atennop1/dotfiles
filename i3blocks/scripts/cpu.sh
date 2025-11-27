#!/usr/bin/env bash

cpu_line1=($(head -n1 /proc/stat))
sleep 1
cpu_line2=($(head -n1 /proc/stat))

total1=0
for val in "${cpu_line1[@]:1}"; do ((total1 += val)); done
total2=0
for val in "${cpu_line2[@]:1}"; do ((total2 += val)); done

idle1=$((cpu_line1[4] + cpu_line1[5]))
idle2=$((cpu_line2[4] + cpu_line2[5]))

cpu_usage=$((100 * ((total2 - total1) - (idle2 - idle1)) / (total2 - total1)))
temp=$(sensors 2>/dev/null | grep -E 'Core [0-9]+:' | awk '{print $3}' | tr -d '+°C' | sort -nr | head -n1)

if [[ -z "$temp" ]]; then
    temp=$(sensors 2>/dev/null | grep -E 'Package id 0:' | awk '{print $4}' | tr -d '+°C')
fi

temp=${temp%.*}
[[ -z "$temp" ]] && temp=0

if ((cpu_usage >= 80 || temp >= 70)); then
    color="#FF0000"
elif ((cpu_usage >= 50 || temp >= 60)); then
    color="#FFA500"
else
    color="#00FF00"
fi

echo "CPU: ${cpu_usage}%, Temp: ${temp}°C"
echo
echo $color
