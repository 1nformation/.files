#!/bin/zsh

STATUS=$($HOME/.config/polybar/get_playerctl_status.sh)

if [ "$STATUS" = "Stopped" ]; then
    echo ""
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook pause 3 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook prev 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook next 2 &>/dev/null

elif [ "$STATUS" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook pause 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook prev 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook next 1 &>/dev/null
    playerctl --player=playerctld metadata --format "  {{ title }} - {{ artist }} "
elif [ "$STATUS" = "No player is running"  ]; then
    echo ""
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook pause 3 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook prev 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook next 2 &>/dev/null
elif [ "$STATUS" = "No player could handle this command"  ]; then
    echo ""
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook pause 3 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook prev 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook next 2 &>/dev/null
else

    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook pause 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook prev 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -q main-b")" hook next 1 &>/dev/null
    playerctl --player=playerctld metadata --format "  {{ title }} - {{ artist }} "
fi
