#!/bin/bash

# getting volumes
volume=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ "$mute" = "true" ]; then
    echo "Sound Muted"
else
    echo "Volume: $volume%"
fi
