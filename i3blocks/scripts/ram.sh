#!/bin/bash

# getting data from file
total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
free=$(grep -E 'MemFree|Buffers|Cached' /proc/meminfo | awk '{sum += $2} END {print sum}')
used=$((total - free))

# converting data
total_mb=$((total / 1024))
used_mb=$((used / 1024))
percent=$((100 * used / total))

# selecting colors
if [ "$percent" -ge 90 ]; then
    color="#FF0000"
elif [ "$percent" -ge 75 ]; then
    color="#FFA500"
else
    color="#00FF00"
fi

echo "RAM: ${used_mb} / ${total_mb} MB"
echo
echo "$color"
