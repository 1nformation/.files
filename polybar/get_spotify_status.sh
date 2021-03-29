#!/bin/zsh

STATUS=$($HOME/.config/polybar/get_playerctl_status.sh)

if [ "$STATUS" = "Stopped" ]; then
    echo " "
elif [ "$STATUS" = "Paused"  ]; then
    playerctl --player=playerctld metadata --format "  {{ title }} - {{ artist }} "
elif [ "$STATUS" = "No player is running"  ]; then
    echo " "
elif [ "$STATUS" = "No player could handle this command"  ]; then
    echo " "
else
    playerctl --player=playerctld metadata --format "  {{ title }} - {{ artist }} "
fi
