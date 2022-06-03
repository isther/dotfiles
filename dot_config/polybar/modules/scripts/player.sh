#!/bin/bash

player_status=$(playerctl status 2> /dev/null)

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo ""
elif [[ $player_status = "Paused" ]]; then
    echo ""
else
    echo ""
fi
