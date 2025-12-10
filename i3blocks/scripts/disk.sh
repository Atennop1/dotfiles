#!/usr/bin/env bash

# getting data
used=$(df --output=used / | tail -n1)
total=$(df --output=size / | tail -n1)

# converting it
used_gb=$(awk "BEGIN {printf \"%.2f\", $used/1024/1024}")
total_gb=$(awk "BEGIN {printf \"%.2f\", $total/1024/1024}")

echo "Disk: ${used_gb} / ${total_gb} GB"
